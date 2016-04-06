class LinksController < ApplicationController
  include ApplicationHelper

before_action :authenticate_user, except: [:create_url, :handle_short_url]

  def create_url
    if vanity_url_exist
      flash[:error] = "Custom URL already exists"
    else
      save_link
    end

    redirect_to dashboard_path
  end

  def handle_short_url
    @link = Link.find_by(short_url: params[:short_url])
    if @link && !@link.deleted
      direct_to_actual_url
    else
      render :deleted_error
    end
  end

  def show
    @link = Link.find_by(id: params[:id])
  end

  def edit
    @link = Link.find_by(id: params[:id])
  end

  def update
    link = Link.find_by(id: params[:id])
    link.update(
      actual_url: params[:actual_url],
      active: active_to_bool(params[:active])
    )
    flash[:update] = "Link Updated Successfully"
    redirect_to dashboard_path
  end

  def delete
    link = Link.find_by(id: params[:id])
    link.update(deleted: true)
    flash[:error] = "Link has been deleted"
    redirect_to dashboard_path
  end

private

  def vanity_url_exist
    vanity = params[:link][:vanity]
    Link.find_by(short_url: vanity) if vanity != ""
  end

  def save_link
    link = Link.create!(link_params)
    link.save
    flash[:short_url] = "#{request.protocol}#{request.host_with_port}"\
    "/#{link.short_url}"
  end

  def link_params
    params.require(:link).permit(:actual_url, :vanity, :user_id)
  end

  def direct_to_actual_url
    if @link.active
      redirect_to @link.actual_url, status: 302
      @link.visits += 1
      Statistic.register(@link, request)
      @link.save
    else
      render :inactive_error
    end
  end

  def active_to_bool(status)
    status == "active" ? true : false
  end

  def inactive_error
  end

  def deleted_error
  end
end
