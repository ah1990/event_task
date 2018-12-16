class AuthenticateUserService < BaseService

  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def call
    if user.errors.empty?
      OpenStruct.new({
        jwt: ::JsonWebToken.encode(user_id: user.id),
        user_id: user.id,
        errors: nil
      })
    else
      user
    end
  end

  def user
    user = ::User.find_by_email(@email)
    return user if user.try(:authenticate, @password)
    user.errors.add(:user_authentication, 'bad credentials')
    user
  end

end
