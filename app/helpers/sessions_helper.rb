module SessionsHelper
  def current_user
    return unless session[:user_id]
    @current_user ||= Moviegoer.find(session[:user_id])
  end
end
