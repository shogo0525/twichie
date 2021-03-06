class Authorization < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, uniqueness: {scope: :provider}

  def self.find_from_auth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"])
  end

  def self.create_from_auth(auth, user = nil)
    user ||= User.create_from_auth!(auth)
    self.create!(
      user: user,
      uid: auth["uid"],
      provider: auth["provider"]
    )
  end
end
