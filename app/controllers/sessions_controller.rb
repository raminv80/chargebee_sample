class SessionsController < ApplicationController

  def new
    session[:return_to] = params[:returnto] unless params[:returnto].nil?
    redirect_to "/auth/mindvalley", status: 301
  end

  def create
    unless request.env["omniauth.auth"]["credentials"].nil?
      auth_token = request.env["omniauth.auth"]["credentials"]["token"]
      user = User.find_or_create_authenticated_user(auth_token)
      if user.present?
        session[:user_id] = user.id unless user.nil?
        redirect_to root_url
        return
      end
    end
    redirect_to root_url, alert: 'User not found or invalid'
  end

  def destroy
    logout
    app_id = Settings.mindvalley.accounts.key
    redirect_to "#{Settings.mindvalley.accounts.api}logout?app_id=#{app_id}"
  end

  private
  def logout
    session[:user_id] = nil
  end

end