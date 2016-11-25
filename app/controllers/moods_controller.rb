class MoodsController < ApplicationController
  before_action :sanitize_mood_pace, only: [:create, :edit]

  def index
    @moods = current_user.moods.all
  end

  def new
    @mood = Mood.new
  end

  def create
    @mood = Mood.new(mood_params)
    @mood.user = current_user

    if @mood.save
      redirect_to user_moods_path(@mood.user)
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @mood = Mood.find(params[:id])
    @mood.destroy

    redirect_to user_moods_path(@mood.user)
  end

  private
    def mood_params
      params.require(:mood).permit(:name, :mood_pace, :mood_experience, :desired_distance)
    end

    def sanitize_mood_pace
      integers = params[:mood][:mood_pace].split(":").map { |num| num.to_i }
      params[:mood][:mood_pace] = pace_conversion(integers)
    end

    def pace_conversion(integers)
      seconds = (integers[0]*60)+(integers[1])
      Time.at(seconds).utc.strftime('%H:%M:%S')
    end


end
