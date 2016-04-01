require "active_support/concern"
module StatisticConcern
  extend ActiveSupport::Concern
  def register_statistic(link, request)
    statistic = Statistic.new
    statistic.ip_address = request.remote_ip
    statistic.referer = request.referer
    statistic.link_id = link.id
    statistic.browser_information = browser_details
    statistic.save
  end

  def browser_details
    user_agent = UserAgent.parse(request.env["HTTP_USER_AGENT"])
    "#{user_agent.browser} #{user_agent.version}"
  end
end
