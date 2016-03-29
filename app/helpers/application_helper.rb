module ApplicationHelper
  def current_user
    @current_user = User.find_by(uid: session[:user_id])
    end

  def show_url_message
    if flash[:short_url]
      render partial: "application/url"
      end
  end

  def login_or_logout
    if current_user
      link_to "Logout", logout_path, class: "btn btn-primary btn-bavel"
    else

      link_to "Login", login_path, class:"btn btn-primary btn-bavel"
    end
  end

  def user_dashboard
     link_to "My Dashboard", dashboard_path, class:"btn btn-primary btn-bavel"  if current_user
   end
end




