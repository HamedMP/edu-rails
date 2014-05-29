class User < ActiveRecord::Base
  attr_accessor :recently_created

  validates :email, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: true
  validates :oauth_token, presence: true, uniqueness: true

  after_create do
    self.recently_created = true
  end

  def recently_created?
    @recently_created
  end

  def self.find_or_create_with_omniauth(auth)
    user = self.find_or_create_by provider: auth["provider"], uid: auth["uid"]

    user.assign_attributes({
      full_name:   auth["info"]["name"],
      email:       auth["info"]["email"],
      oauth_token: auth["credentials"]["token"]
    })

    user.save validate: false

    user
  end
end
