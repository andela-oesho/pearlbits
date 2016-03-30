class Link < ActiveRecord::Base
  belongs_to :user
  has_many :statistics

  URL_MATCH = /\A(https?:\/\/)?([a-z0-9]+\.)?[a-z0-9\-]+\.[a-z]+.+[^\W\_]\z/
  validates :actual_url, presence: true, format: { with: URL_MATCH }

  after_create :generate_short_url

  def generate_short_url
    self.short_url = vanity == "" ? id.to_s(36) : vanity
    self.actual_url = (actual_url[0..3] == "http") ? actual_url : "http://" + actual_url
    save
  end

  def self.retrieve(id)
    where("user_id = ?", id)
  end
end
