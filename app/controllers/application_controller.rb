class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cur_location

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, notice: exception.message
  end

  def set_cur_location
    @lat_lng = cookies[:lat_lng].nil? ? nil : cookies[:lat_lng].split('|')
  end
end
