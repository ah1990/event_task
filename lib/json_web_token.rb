module JsonWebToken

  class << self
    def encode(payload, expiration = 24.hours.from_now)
      payload[:expiration] = expiration.to_i
      JWT.encode(payload, ENV['API_TOKEN'])
    end

    def decode(token)
      raw = JWT.decode(token, ENV['API_TOKEN']).first
      HashWithIndifferentAccess.new(raw)
    rescue
      nil
    end
  end

end