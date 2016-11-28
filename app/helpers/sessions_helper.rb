module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?
    find_and_ensure_user
    @user == current_user
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Login before viewing content'
      redirect_to new_session_path
    end
  end

  def correct_user
    render 'application/error_404' unless current_user?
  end

  def redirect_back_or(default)
    redirect_to(session[:forarding_url] || default)
    session.delete(:forarding_url)
  end

  def store_location
    session[:forarding_url] = request.original_url if request.get?
  end
end
