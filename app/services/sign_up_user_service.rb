class SignUpUserService < BaseService

  def initialize(user_params:)
    @user_params = user_params
  end

  def call
    user = User.new(@user_params)
    user.save
    user
  end
end