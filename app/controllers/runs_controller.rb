class RunsController < ApplicationController
  include RunHelper
  before_action :sanitize_params, only: [:create, :update]

  def new
    p params
    @run = Run.new
  end

  def create
    binding.pry
    run = Run.new(run_params)
    if run.save
      p "Run saved"
      flash[:success] = "Run saved."
      redirect_to user_profile_path(current_user, current_user.profile.id)
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

  private

  def run_params
    params.require(:run).permit(:run_date, :time, :zipcode, :mood_id, :runner_id)
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
