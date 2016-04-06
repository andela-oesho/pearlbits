class Statistic < ActiveRecord::Base
  belongs_to :link

   def self.register(link, request)
    statistic = new
    statistic.ip_address = request.remote_ip
    statistic.referer = request.referer
    statistic.link_id = link.id
    statistic.browser_information = browser_details(request)
    statistic.save
  end

  def self.browser_details(request)
    user_agent = UserAgent.parse(request.env["HTTP_USER_AGENT"])
    "#{user_agent.browser} #{user_agent.version}"
  end
end
