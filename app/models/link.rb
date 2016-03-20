class Link < ActiveRecord::Base
  after_create :generate_short_url
 
  

  def generate_short_url
    self.short_url = id.to_s(36)
    binding.pry
    self.actual_url = link
    link = (link[0..3] == 'http') ? link : 'http://'+link
    self.save
  end
end
