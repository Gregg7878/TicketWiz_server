class TicketsController < ApplicationController

    before_action :authenticate_user

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


    
end
