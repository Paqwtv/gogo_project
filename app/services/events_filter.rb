class EventsFilter
  def initialize(params)
    @params = params
  end

  def default_hash
    {
      query: '',
      categories: []
    }
  end

  def category?(id)
    if params[:categories].blank?
      false
    else
      params[:categories].include?(id)
    end
  end

  def params
    @params.blank? ? default_hash : @params
  end

  def records
    result = Event.all
    result = Event.search(@params[:query]) if @params[:query]
    result = result.includes(:categories).where(categories: { id: @params[:categories] }) if @params[:categories]
    result
  end
end
