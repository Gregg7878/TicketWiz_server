class TicketsController < ApplicationController

    before_action :authenticate_user
    before_action :set_event, only: [:create]
    before_action :set_ticket, only: [:show, :destroy]

    # display list of tickets for current user
    def index
        @tickets = current_user.tickets
    end

    # create a new ticket
    def create
        @ticket = Ticket.new(ticket_params)
        if @ticket.save
          render json: @ticket, status: :created
        else
          render json: @ticket.errors, status: :unprocessable_entity
        end
    end

    # display details of a specific ticket by its ID
    def show
        @ticket = Ticket.find(params[:id])
    end


    # delete a ticket by its ID
    def destroy
        @ticket = Ticket.find(params[:id])
        @ticket.destroy
        head :no_content
    end

    private

    def ticket_params
        params.require(:ticket).permit(:event_id, :customer_id, :ticket_type, :quantity)
      end
    
      def set_event
        @event = Event.find(params[:event_id])
      end
    
      def set_ticket
        @ticket = Ticket.find(params[:id])
      end
end
