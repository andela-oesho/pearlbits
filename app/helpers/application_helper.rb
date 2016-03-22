module ApplicationHelper
	def current_user
			@current_user = User.find_by(uid: session[:user_id])
		end

	def show_url_message
		if flash[:short_url]
			render partial: "application/url"
			end		
	end
end
