module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def logged_in_user
    redirect_to new_session_url unless logged_in?
  end
end
