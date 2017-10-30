class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @page = params[:page] ? params[:page] : 1
    @filter = EventsFilter.new(params[:filter])
    if params[:filter]
      #init Filter Object 
      @events = @filter.records
    else
      @events = Event.all
    end
    @events = @events.paginate(:page => @page, per_page: Event.per_page)   
    # @points = @events.map(&:point).merge(Profile.current_point(@lat_lng))
    
    respond_to do |format|
      format.html
      format.json {render partial: "list", locals: {events: @events }}
    end

  end

  def search
    @filter = EventsFilter.new(params[:filter])
    @events = @filter.records
    @events = @events.paginate(:page => @page, per_page: Event.per_page)
    render partial: "list", locals: {events: @events }
  end

  def show
  end

  def new
    if current_user.profile.user_name.blank?
      redirect_to edit_profile_path(current_user.id), notice: 'Заполните ваш профиль перед созданием нового EVENT.'
    else
      @event = Event.new
    end
  end

  def edit
  end

  def create
    @event = Event.new(event_params.merge(profile_id: current_user.profile.id))
    @event.author = current_user.profile.user_name
    @event.save
    if @event.save
      respond_to do |format|
        format.html {redirect_to @event, notice: 'Event was successfully created.'}
        format.json {render text: 'Yee!'}
      end
    else
      render :edit
    end
  end

  def update
    if @event.update(event_params)
      respond_to do |format|
        format.html { redirect_to @event, notice: 'Event was successfully updated.'}
        format.json { render json: {a: 'Yee!'}}
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

    def append_cur_location
      unless @lat_lng.blank?
        @hash << { :lat=>@lat_lng[0], :lng=>@lat_lng[1]}
      end   
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:author, :title, :description, :date_time, :latitude, :longitude, :private, :contacts, :category_ids => [])
    end
end
