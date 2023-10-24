class CalendarEventsController < ApplicationController

    before_action :authenticate_user, only: [:create]

    # Display a list of calendar events for the current user
    def index
        @calendar_events = current_user.calendar_events
    end

    # Create a calendar event for the current user
    def create
        @calendar_event = current_user.calendar_events.build(calendar_event_params)

        if @calendar_event.save
            render json: @calendar_event, status: :created
        else 
            render json: @calendar_event.errors, status: :unprocessable_entity
        end
    end

    #delete calendar event by id
    def destroy
        @calendar_event = CalendarEvent.find(params[:id])
        @calendar_event.destroy
        head :no_content
    end

    private

    def calendar_event_params
        params.require(:calendar_event).permit(:event_id)
    end

    def authenticate_user
        unless current_customer || current_organizer
          render json: { error: "Unauthorized" }, status: :unauthorized
        end
      end

end
