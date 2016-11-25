require 'unirest'
class UsersController < ApplicationController
    before_action :geocode_zip, only: [:create, :update]
    before_action :logged_in_user, :find_and_ensure_user, only: [:show, :edit, :update]
    before_action :correct_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    binding.pry
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "You're almost there! Please tell us a little more about yourself."
      redirect_to new_user_profile_path(user)
    else
      @errors = user.errors.full_messages
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
    def find_and_ensure_user
      render 'application/error_404' unless @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :location, :password, :password_confirmation)
    end

    def correct_user
      render 'application/error_404' unless current_user?
    end

    def geocode_zip
      url = "http://maps.googleapis.com/maps/api/geocode/json?"
      parameters = { address: params[:user][:location], sensor: 'true' }
      response = Unirest.get(url, headers: {}, parameters: parameters)
      params[:user][:location] = response.body['results'][0]['address_components'][1]['short_name']
    end
end
