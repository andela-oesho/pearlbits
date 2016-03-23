class Link < ActiveRecord::Base
	belongs_to :user

  URL_MATCH = /\A(https?:\/\/)?([a-z0-9]+\.)?[a-z0-9\-]+\.[a-z]+.+[^\W\_]\z/
  validates :actual_url, presence: true, format: { with: URL_MATCH }

  after_create :generate_short_url

  def generate_short_url
    self.short_url = id.to_s(36)
   self.actual_url = (self.actual_url[0..3] == "http") ? self.actual_url : "http://" + self.actual_url
    self.save
  end

  def self.retrieve(id)
  	where("user_id = ?", id)
  end
end
