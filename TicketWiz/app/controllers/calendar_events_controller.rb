class CalendarEventsController < ApplicationController

    before_action :authenticate_user

    def index
        @calendar_events = current_user.calendar_events
    end

end
