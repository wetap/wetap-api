class AuthTokenPair < ActiveRecord::Base
  belongs_to :user

  def self.generate_for(user)
    return user.auth_token_pair if user.auth_token_pair.present?

    auth = new
    auth.private_token = SecureRandom.hex(20)
    auth.public_token = SecureRandom.hex(20)
    auth.user = user
    user.auth_token_pair = auth
    auth.save
    return auth
  end

end
