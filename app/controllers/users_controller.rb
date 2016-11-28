require 'unirest'
class UsersController < ApplicationController
    before_action :logged_in_user, :find_and_ensure_user, only: [:show, :edit, :update]
    before_action :correct_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "You're almost there! Please tell us a little more about yourself." # This needs to be styled, otherwise, let's remove it
      redirect_to new_user_profile_path(user)
    else
      @errors = user.errors.full_messages
      render 'new'
    end
  end

  def show
    # binding.pry
    # runs_by_date = @user.runs.where("run_date > ?", DateTime.now)
    # results = {}
    # runs_by_date.each { |run| results[run] = Time.at(run.time).utc.strftime('%H:%M:%S').in_time_zone("Eastern Time (US & Canada)") } #can we find the differnce between the date that line 27 returns and add the difference to the time objects?
    # @upcoming_runs = results.select { |k, v| v < DateTime.now }.keys #this might have to be reversed with the greater_than or less_than operator
  end

  def edit
  end

  def update

  end

  private
    def find_and_ensure_user
      render 'application/error_404' unless @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :zipcode, :latitude, :longitude, :password, :password_confirmation)
    end

    def find_midpoint(user_coord, result_coord)
      midpoint = [(user_coord[0] + result_coord[0]) / 2 , (user_coord[1] + result_coord[1]) / 2 ]
    end
end
