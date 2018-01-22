class User < ApplicationRecord
  has_many :authorizations
  has_many :posts

  def self.create_from_auth!(auth)
    self.create!(
      email: auth["info"]["email"],
      nickname: auth["info"]["name"]
    )
  end
end
