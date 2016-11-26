class ProfilesController < ApplicationController
  before_action :sanitize_profile_params, only: [:create, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    # debugger
    # @profile.user = current_user
    if @profile.save
      redirect_to user_profile_path(@profile.user_id, @profile)
    else
      render 'new'
    end
  end

  def show
    # @profile = current_user.profile
    # debugger
    user = User.find(params[:user_id])
    @profile = user.profile
  end

  def edit
    @profile = Profile.find_by(user_id:[current_user.id])
  end

  def update
    # debugger
    @profile = Profile.find_by(user_id:[current_user.id])
    if @profile.update(profile_params)
      redirect_to user_profile_path(@profile.user_id, @profile)
    else
      render 'edit'
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:why_i_run, :user_pace, :goals, :user_id, :experience, :need_to_knows)
    end

    def sanitize_profile_params
      # params['profile']['experience'] = params['experience']
      params['profile']['user_id'] = current_user.id
    end
end
