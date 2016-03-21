class PageController < ApplicationController
	  include ApplicationHelper
  def index
  end
  def login_page
  end
  def dashboard
  	flash[:recent_links] =  Link.retrieve(current_user.id)
  end
end
