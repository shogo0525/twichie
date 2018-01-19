class User < ApplicationRecord
  has_many :authorizations

  def self.create_from_auth!(auth)
    self.create!(
      email: auth["info"]["email"],
      nickname: auth["info"]["name"]
    )
  end
end
