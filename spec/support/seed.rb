class Seed
  def self.create_users
    users = { name: "name", provider: ["twitter", "google"].sample, uid: [*0..9].sample(8).join, link_count: rand(9)}
  end

  def self.create_links
    links = {short_url: [*"a".."z"].sample(4).join}
  end
end
