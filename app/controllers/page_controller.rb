class PageController < ApplicationController
  include ApplicationHelper
  def index
    @popular_links = Link.order(visits: :desc).limit(5)
    @anoymus_links = Link.order(id: :desc).limit(5)
    @top_users = User.order(link_count: :desc).limit(5)
  end

  def dashboard
    if current_user
    @recent_links = Link.retrieve(current_user.id).order(id: :desc).limit(5)
    else
      redirect_to root_path
    end
  end
end
