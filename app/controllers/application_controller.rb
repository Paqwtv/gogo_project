class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cur_location

  def set_cur_location
    @lat_lng = cookies[:lat_lng].nil? ? nil : cookies[:lat_lng].split("|")
  end
end
