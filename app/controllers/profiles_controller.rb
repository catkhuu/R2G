class ProfilesController < ApplicationController
  include ProfilesHelper
  before_action :logged_in_user, :find_and_ensure_user, :correct_user
  before_action :find_and_ensure_profile, only: [:show, :edit, :update]
  before_action :sanitize_profile_params, only: [:create, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_profile_path(@profile.user_id, @profile)
    else
      render 'new'
    end
  end

  def show
    @location = geocode_zip(@user)
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_profile_path(@profile.user_id, @profile)
    else
      render 'edit'
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:why_i_run, :goals, :user_id, :experience, :need_to_knows, :avatar)
    end

    def find_and_ensure_user
      render 'application/error_404' unless @user = User.find_by(id: params[:user_id])
    end

    def find_and_ensure_profile
      render 'application/error_404' unless @profile = current_user.profile
    end

    def sanitize_profile_params
      params['profile']['user_id'] = current_user.id
    end
end
