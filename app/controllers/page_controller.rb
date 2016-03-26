class PageController < ApplicationController
  include ApplicationHelper
  def index
    @popular_links = Link.order(visits: :desc).limit(10)
    flash[:anoymus_links] = Link.order(id: :desc).limit(10)
    @top_users = User.order(link_count: :desc).limit(10)
  end

  def login_page
  end

  def dashboard
    flash[:recent_links] = Link.retrieve(current_user.id).order(id: :desc).limit(10)
  end
end
