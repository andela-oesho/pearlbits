class Link < ActiveRecord::Base
  after_create :generate_short_url

  def generate_short_url
    self.short_url = id.to_s(36)
    self.save
  end
end
