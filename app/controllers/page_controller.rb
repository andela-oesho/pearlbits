class PageController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user, except: [:index]

  def index
    @popular_links = Link.popular
    @anoymus_links = Link.anonymous
    @top_users = User.top
  end

  def dashboard
    @recent_links = Link.retrieve(@current_user.id)
  end
end
