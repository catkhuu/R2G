class RunsController < ApplicationController
  include RunHelper
  before_action :sanitize_params, only: [:create, :update]
  # before_action :find_and_ensure_run, only: [:upvote, :declines]

  def new
    @run = Run.new
    render partial: 'users/run_info', layout: false, locals: { run: @run }
  end

  def create
    @run = Run.new(run_params)
    if @run.save
      zipcode_list = retrieve_zipcodes_within_radius(@run.zipcode)
      matchers = search_by_date_time(zipcode_list, @run)
      # binding.pry
      flash[:success] = "Run saved."
      render partial: 'runs/run', layout: false, locals: { run: @run }
      # redirect_to user_profile_path(current_user, current_user.profile.id)
    else
      @errors = run.errors.full_messages
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def upvotes
    #might have to pass run_id instead because time, date, and runner_id currently is not unique
    companions_run = Run.where(runner_id: params[:companion_id], run_date: @run.run_date, time: @run.time).limit(1).first
    if @run.update(companion_id: params[:companion_id])
      if companions_run.companion_id == current_user.id
        render partial: "some partial with map", layout: false, locals: { whatever locals }
      else
        render partial: "some partial with companion blurb and send pending view to corresponding runner", layout: false, locals: { some locals }
      end
    else
      @errors = { error: "unable to update companion" }.to_json
    end
  end

  def declines
    if companions_run = current_user.runs_as_companion.where(id: params[:run_id]).update(reject: true, companion_id: nil)
      puts 'some success message for US'
    else
      @errors = { error: 'decline unsuccessful' }.to_json
    end
  end

  private

  def run_params
    params.require(:run).permit(:run_date, :time, :zipcode, :mood_id, :runner_id)
  end

  def find_and_ensure_run
    render 'application/error_404' unless @run = current_user.runs.find_by(id: params[:id])
  end

  def sanitize_params
    if params[:run][:run_daypart] == 'PM'
      params[:run][:run_hours] = params[:run][:run_hours].to_i + 12
    end
    hr_sec = convert_hours_to_seconds(params[:run][:run_hours])
    min_sec = convert_minutes_to_seconds(params[:run][:run_minutes])
    params[:run][:time] = hr_sec + min_sec
    params[:run][:runner_id] = current_user.id
  end
end
