module ApiHelper
  def authenticated_header(request, user)
    payload = { user_id: user.id }
    payload[:expiration] = 24.hours.from_now.to_i
    token = JWT.encode(payload, ENV['API_TOKEN'])
    request.headers.merge!('Authorization': "Bearer #{token}")
  end
end