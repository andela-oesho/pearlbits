class PageController < ApplicationController
	  include ApplicationHelper
  def index
    @popular_links = Link.order(visits: :desc).limit(10)
  	flash[:anoymus_links] = Link.order(id: :desc).limit(10)
  	flash[:top_users] = User.order(id: :desc).limit(10)
  end
  def login_page
  end
  def dashboard
    if current_user
      flash[:recent_links] = Link.retrieve(current_user.id).order(id: :desc).limit(5)
    else
      redirect_to root_path
    end
  end
end
