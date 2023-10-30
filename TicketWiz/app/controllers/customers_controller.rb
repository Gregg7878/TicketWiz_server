class CustomersController < ApplicationController
  before_action :authorize_customer
  skip_before_action :authorize_customer, only: [:create] 


    def show   
      customer = Customer.find_by(id: session[:customer_id]) 
      if customer
          render json: customer, status: :created 
      else
          render json: { error: "not authorized here" }, status: :unauthorized 
      end 
    end  
  
    def create 
      customer = Customer.new(customer_params)
      
      if customer.save 
        session[:customer_id] = customer.id 
        render json: customer, status: :created 
      else
        render json: { error: customer.errors.full_messages }, status: :unauthorized 
      end
    end

    def event_history
      customer_tickets = Ticket.where(customer_id: session[:customer_id])
      customer_events = customer_tickets.map { |ticket| ticket.event }
  
      render json: customer_events, status: :ok
    end
  
    def ticket_wallet
      ticket_data = Ticket.where(customer_id: session[:customer_id])
      ticket_wallet_data = ticket_data.map do |ticket|
        { event_name: ticket.event.title, event_category: ticket.event.category, ticket_type: ticket.ticket_type }
      end
  
      render json: ticket_wallet_data, status: :ok
    end
  
    private 

    def customer_params 
      params.permit(:first_name, :last_name, :password, :email, :phone_number, :age)
    end    

    def authorize_customer 
      return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :customer_id
    end
end

