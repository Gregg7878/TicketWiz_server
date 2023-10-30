class CustomersController < ApplicationController
  before_action :authorize_customer
  skip_before_action :authorize_customer, only: [:create] 
  before_action :authorize_customer
  skip_before_action :authorize_customer, only: [:create] 
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

    def customer_params 
      params.permit(:first_name, :last_name, :password, :email, :phone_number, :age)
    end    

    def authorize_customer 
      return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :customer_id
    end
    def customer_params 
      params.permit(:first_name, :last_name, :password, :email, :phone_number, :age)
    end    

    def authorize_customer 
      return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :customer_id
    end
end



