class Users::RegistrationsController < ApplicationController
skip_before_filter :authenticate_user_from_token!

  # POST /resource
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in :user, @user
      @user.generate_authentication_token
      render json: {
          result: 'success',
          user: @user,
          token: @user.authentication_token
      }.to_json
    else
      render json: {
          result: 'fail',
          errors: @user.errors
      }.to_json
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
