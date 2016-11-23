class ProfilesController < ApplicationController

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  private
    def profile_params
      params.require(:profile).permit(:why_i_run, :)
    end
end
