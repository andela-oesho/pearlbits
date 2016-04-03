class PageController < ApplicationController
  include ApplicationHelper
  def index
    @popular_links = Link.popular
    @anoymus_links = Link.anonymous
    @top_users = User.top
  end

  def dashboard
    if current_user
      @recent_links = Link.retrieve(current_user.id).order(id: :desc).limit(5)
    else
      redirect_to root_path
    end
  end
end
