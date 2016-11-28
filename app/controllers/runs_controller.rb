class RunsController < ApplicationController
  include RunsHelper
  before_action :sanitize_params, only: [:create, :update]
  # before_action :find_and_ensure_run, only: [:upvote, :declines]

  def new
    @run = Run.new
    render partial: 'runs/new_run', layout: false, locals: { run: @run }
  end

  def create
    @run = Run.new(run_params)
    if @run.save
    #   zipcode_list = retrieve_zipcodes_within_radius(@run.zipcode)
    #   matchers = search_by_date_time(zipcode_list, @run)
    #   flash[:success] = "Run saved."
    #   render partial: 'runs/run', layout: false, locals: { run: @run }
    # else
    #   @errors = run.errors.full_messages
    #   render 'new'
    end
  end

  def new_search
    if request.xhr?
      render 'new_search', layout: false
    end 
  end

  def search
     by_proximity_and_date = Run.near(current_user.zipcode, 100).where(run_date: params[:run_date])
     search_results = by_proximity_and_date.select { |run| run.runner.narrow_by_experience(current_user) } #the User model method may or may not work
  end

  def show
  end

  def edit
  end

  def update
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
