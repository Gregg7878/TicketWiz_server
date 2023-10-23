class TicketsController < ApplicationController
    before_action :authenticate_user, only: [:create]
    before_action :set_event, only: [:create]
    before_action :set_ticket, only: [:show, :destroy]
  
    def index
      @tickets = current_user.tickets
    end
  
    def create
      if @event.available_tickets_count >= params[:ticket][:quantity].to_i
        @ticket = Ticket.new(ticket_params)
        @ticket.event = @event
  
        if @ticket.save
          @event.available_tickets_count -= @ticket.quantity
          @event.save
  
          render json: @ticket, status: :created
        else
          puts @ticket.errors.full_messages
          render json: @ticket.errors, status: :unprocessable_entity
        end
      else
        render json: { error: "Not enough available tickets for this quantity" }, status: :unprocessable_entity
      end
    end
  
    def show
        @ticket = Ticket.find(params[:id])
      
        if @ticket
          @ticket_price = @ticket.calculate_price
          render json: { ticket: @ticket, ticket_price: @ticket_price }, status: :ok
        else
          render json: { error: "Ticket not found" }, status: :not_found
        end
    end
  
    def destroy
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

    def authenticate_user
      unless current_customer || current_organizer
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end
  end
  