class SessionsController < ApplicationController
  def index
  end
  def create
    auth = request.env["omniauth.auth"]
    if auth.present?
      unless @auth = Authorization.find_from_auth(auth)
        @auth = Authorization.create_from_auth(auth)
      end
      log_in(@auth.user)
      redirect_to sessions_path
    end
  end

  def destroy
    reset_session
    redirect_to sessions_path
  end
end
