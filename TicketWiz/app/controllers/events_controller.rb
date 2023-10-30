class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events = Event.all
    render json: @events, each_serializer: EventSerializer
  end
  
  def featured
    @featured_events = Event.limit(4)
    render json: @featured_events
  end

  def show
      @event = Event.find(params[:id])
      render json: @event
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.organiser_id = session[:organiser_id]
  
    if @event.save
      render json: @event, status: :created
    else
      render json: { error: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  def edit
  end

  def destroy
   if @event.organiser_id == session[:organiser_id]
      @event.destroy
      head :no_content
    else
      render json: { error: 'Not authorized to delete this event' }, status: :unauthorized
    end
  end

  def update
   if @event.organiser_id == session[:organiser_id]
      if @event.update(event_params)
        render json: @event, status: :accepted
      else
        render json: { error: @event.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Not authorized to update this event' }, status: :unauthorized
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :category, :image_url, :date, :start_time, :end_time, :venue_name, :event_location, :price, :available_tickets_count, :organiser_id)
  end
end
