class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update destroy]
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @page = params[:page] ? params[:page] : 1
    @filter = EventsFilter.new(params[:filter])
    if params[:filter]
      @events = @filter.records
    else
      @events = Event.all
    end
    @events = @events.paginate(page: @page, per_page: Event.per_page)
    profile_points = @lat_lng.nil? ? nil : Profile.to_point(@lat_lng)
    points_array = @events.map(&:to_point) << profile_points
    @points = MarkerFilter.new(points_array).markers_data
    if params[:layout_false]
      render partial: 'list', locals: { events: @events }
    else
      render
    end
  end

  def show
    @point = make_marker(@event.to_point)
  end

  def new
    @point = make_marker(Profile.to_point(@lat_lng))
    if current_user.profile.user_name.blank?
      redirect_to edit_profile_path(current_user.id), notice: 'Заполните ваш профиль перед созданием нового EVENT.'
    else
      @event = Event.new
    end
  end

  def edit
    @point = make_marker(@event.to_point)
    authorize! :edit, @user
  end

  def create
    @event = Event.new(event_params.merge(profile_id: current_user.profile.id))
    @event.author = current_user.profile.user_name
    @event.save
    if @event.save
      respond_to do |format|
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render text: 'Yee!' }
      end
    else
      render :edit
    end
  end

  def update
    if @event.update(event_params)
      respond_to do |format|
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render json: { a: 'Yee!' } }
      end
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def make_marker point
    MarkerFilter.new([point]).markers_data.first
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    e_params = params.require(:event).permit(:author, :title, :description, :date_time, :latitude, :longitude, :private, :contacts, :address, category_ids: [])
    e_params[:category_ids] = params[:event][:categories] if params[:event][:categories]
    e_params
  end
end
