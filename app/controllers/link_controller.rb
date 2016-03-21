class LinkController < ApplicationController
  include ApplicationHelper
	def create_url
		link = Link.create!(link_params)
    link.user_id = current_user.id
    link.save

		if link
			flash[:short_url] = "#{request.protocol}#{request.host_with_port}/#{link.short_url}"

			redirect_to dashboard_path
		else
			redirect_to dashboard_path
		end
	end

  def handle_short_url
    link = Link.find_by(short_url: params[:short_url])

    if link
      redirect_to link.actual_url, status: 302
    else
      redirect_to root_path
    end
  end

  def link_params
  	params.require(:link).permit(:actual_url)
  end
end
