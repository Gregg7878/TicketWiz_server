class CalendarEventsController < ApplicationController

    before_action :authenticate_user

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

end
