class SessionsController < ApplicationController
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_user
  def create
    begin
      auth=request.env["omniauth.auth"]
      user=Moviegoer.find_by_provider_and_uid(auth["provider"],auth["uid"]) ||
        Moviegoer.create_with_omniauth(auth)
      session[:user_id] = user.id
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to movies_path
  end
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to movies_path
  end
end
