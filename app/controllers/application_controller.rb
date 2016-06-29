class ApplicationController < ActionController::API
  before_filter :authenticate_user_from_token!

  private

  def authenticate_user_from_token!

    auth_token = request.headers[:Authorization]
    if auth_token
      authenticate auth_token
    else
      authentication_error
    end
  end

  private

  def authenticate(auth_token)
    unless auth_token.include?(':')
      authentication_error
      return
    end

    id = auth_token.split(':').last.to_i
    user = User.where(id: id).first

    if user && Devise.secure_compare(user.authentication_token, auth_token)
      sign_in :user, user, store: false
    else
      authentication_error
    end
  end

  def authentication_error
    render json: { error: 'unauthorized' }.to_json, status: 401
  end
end
