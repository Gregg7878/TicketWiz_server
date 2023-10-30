class OrganiserSessionsController < ApplicationController
    def create 
        organiser = Organiser.find_by(email: params[:email])
        if organiser&.authenticate(params[:password])
            session[:organiser_id] = organiser.id 
            render json: organiser    
        
        else
            errors = ["Invalid email or password"]
            render json: { errors: errors }, status: :unauthorized 
        end 
    end

    def destroy
        session.delete :organiser_id
        head :no_content
    end
end
