class Users::SessionsController < ApplicationController
  skip_before_filter :authenticate_user_from_token!

  # POST /resource/sign_in
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    invalid_login_attempt unless @user

    if @user.valid_password?(params[:password])
      sign_in :user, @user
      @user.generate_authentication_token

      render json: { result: 'success', user: @user }.to_json
    else
      invalid_login_attempt
    end

  end

  # DELETE /resource/sign_out
  def destroy
    current_user.delete_authentication_token
    render json: { result: 'success', message: 'successfully logged out' }.to_json
  end

  private

  def invalid_login_attempt
    render json: { result: 'fail', error: 'login failed' }.to_json
  end

end
