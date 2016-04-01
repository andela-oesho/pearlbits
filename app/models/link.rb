class Link < ActiveRecord::Base
  belongs_to :user
  has_many :statistics

  validates :actual_url, presence: true

  after_create :generate_short_url

  def generate_short_url
    self.short_url = vanity == "" ? id.to_s(36) : vanity
    unless actual_url[0..3] == "http"
      self.actual_url = "http://" + actual_url
    end
    save
  end

  def self.retrieve(id)
    where("user_id = ?", id)
  end

  def self.popular
    order(visits: :desc).limit(5)
  end

  def self.anonymous
    order(id: :desc).limit(5)
  end
end
