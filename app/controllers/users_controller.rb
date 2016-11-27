require 'unirest'
class UsersController < ApplicationController
    before_action :geocode_zip, only: [:create, :update]
    before_action :logged_in_user, :find_and_ensure_user, only: [:show, :edit, :update]
    before_action :correct_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
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

    def find_midpoint(user_coord, result_coord)
      midpoint = [(user_coord[0] + result_coord[0]) / 2 , (user_coord[1] + result_coord[1]) / 2 ]
    end
end
