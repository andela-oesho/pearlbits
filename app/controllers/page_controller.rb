class PageController < ApplicationController
	  include ApplicationHelper
  def index
  	flash[:anoymus_links] = Link.order(id: :desc).limit(10)
  end
  def login_page
  end
  def dashboard
  	flash[:recent_links] =  Link.retrieve(current_user.id).order(id: :desc).limit(10)
  end
end
