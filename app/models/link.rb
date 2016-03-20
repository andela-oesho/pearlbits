class Link < ActiveRecord::Base
  after_create :generate_short_url
 
  

  def generate_short_url
    self.short_url = id.to_s(36)
   self.actual_url = (self.actual_url[0..3] == "http") ? self.actual_url : "http://" + self.actual_url
    self.save
  end
end
