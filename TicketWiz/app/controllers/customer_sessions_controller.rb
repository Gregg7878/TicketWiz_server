class CustomerSessionsController < ApplicationController
    def create 
        customer = Customer.find_by(email: params[:email])
        if customer&.authenticate(params[:password])
            session[:customer_id] = customer.id 
            render json: customer     
        
        else
            render json: { errors: "Invalid email or password" }, status: :unauthorized 
        end 
    end

    def destroy
        session.delete :customer_id
        head :no_content
    end
end
