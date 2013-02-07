class EventsController < ApplicationController
  before_filter :auth_and_time_zone

  def index
    # event_finders
    # if params[:unit_id]
    #   @unit = Unit.find(params[:unit_id])
    #   @events = @unit.events.by_start
    # else
    #   @events = @events.joins(unit: :users).where(users: {id: current_user.id}).by_start
    # end
    # @events = @events.time_range(params[:start], params[:end]) if (params[:start] && params[:end])
    if params[:unit_id]
      @limit = (params[:limit] || 5).to_i
      @unit = current_user.units.where(id: params[:unit_id]).first
    else
      @events = Event.joins(unit: :users).where(users: {id: current_user.id}).by_start
      @events = @events.time_range(params[:start], params[:end]) if (params[:start] && params[:end])
    end

    respond_to do |format|
      format.html
      format.json { render json: @events }
      format.js
    end
  end

  def calendar
    calendar_events(params)
    render json: @events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @unit = params[:unit_id] ? Unit.find(params[:unit_id]) : Unit.first
    @event = Event.new(start_at: Time.zone.now.to_next_hour, end_at: 1.hour.from_now.to_next_hour)
    @sub_unit_ids = []
  end

  def edit
    @event = Event.find(params[:id])
    @unit = @event.unit
    @sub_unit_ids = @event.sub_unit_ids
  end

  def create
    @event = Event.new(params[:event])
    # @unit = Unit.find(params[:unit_id]) if params[:unit_id]
    # @event = @unit.events.build(params[:event])

    if @event.save
      redirect_to events_url, notice: 'Event was successfully created.'
    else
      @sub_unit_ids = sub_unit_ids(params[:event][:sub_unit_ids])
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      redirect_to events_url, notice: 'Event was successfully updated.'
    else
      @sub_unit_ids = sub_unit_ids(params[:event][:sub_unit_ids])
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_url
  end

  private
    def set_tz
      Time.zone = "Arizona"
    end

    def sub_unit_ids(params)
      if params
        params.map{|id| id.to_i}
      else
        []
      end
    end

end
