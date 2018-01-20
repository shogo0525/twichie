class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    if auth.present?
      unless @auth = Authorization.find_from_auth(auth)
        @auth = Authorization.create_from_auth(auth)
      end
      log_in(@auth.user)
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
