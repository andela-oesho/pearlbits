class User < ActiveRecord::Base
  has_many :links

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.save
    end
  end

  def self.top
    order(link_count: :desc).limit(5)
  end
end
