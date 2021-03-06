module ApplicationHelper
  def show_url_message
    if flash[:short_url]
      render partial: "application/url"
    end
  end

  def show_user_message
    if flash[:short_url]
      render partial: "application/user_url_message"
    end
  end

  def login_or_logout
    if @current_user
      link_to "Logout", logout_path, class: "btn btn-primary btn-bavel"
    else
      link_to "Login", login_path, class: "btn btn-primary btn-bavel"
    end
  end

  def user_dashboard
    if @current_user
      link_to "My Dashboard", dashboard_path, class: "btn btn-primary"
    end
  end

  def welcome_user
    if @current_user
      "Hi" + " " + @current_user.name
    end
  end
end
