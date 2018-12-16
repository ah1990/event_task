class Api::V1::SessionsController < Api::V1::ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_request

  def login
    unless params[:email] && params[:password]
      render status: :unauthorized, json: {
        success: false
      }
    end

    login_user
  end

  def sign_up
    action = SignUpUserService.call(user_params: user_params.to_h)
    if action.result.errors.empty?
      login_user
    else
      render json: { error: action.result.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :surname, :email, :password, :password_confirmation)
  end

  def login_user
    action = ::AuthenticateUserService.call(
      email: params[:email],
      password: params[:password]
    )
    byebug
    if action.result&.errors.present?
      render json: { error: action.result.errors.messages, message: 'Email или пароль неверны' }, status: :unauthorized
    else
      render json: {
        user_id: action.result.user_id,
        auth_token: action.result.jwt,
      }
    end
  end
end