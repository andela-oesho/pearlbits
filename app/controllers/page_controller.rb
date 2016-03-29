class PageController < ApplicationController
  include ApplicationHelper
  def index
    @popular_links = Link.order(visits: :desc).limit(5)
    flash[:anoymus_links] = Link.order(id: :desc).limit(5)
    @top_users = User.order(link_count: :desc).limit(5)
  end

  def login_page
  end

  def dashboard
    flash[:recent_links] = Link.retrieve(current_user.id).order(id: :desc).limit(5)
  end
end
