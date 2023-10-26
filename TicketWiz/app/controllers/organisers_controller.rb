class OrganisersController < ApplicationController
    before_action :authorize_organiser
    skip_before_action :authorize_organiser, only: [:create] 

    def show 
        organiser = Organiser.find_by(id: session[:organiser_id]) 
        if organiser
            render json: organiser 
        else
            render json: { error: "not authorized here" }, status: :unauthorized 
        end 
    end

    def create 
        @organiser = Organiser.new(organiser_params)
        
        if @organiser.save 
          session[:organiser_id] = @organiser.id
          OrganiserMailer.with(organiser: @organiser).welcome_email.deliver_later 
          render json: @organiser, status: :created 
        else
          render json: { error: @organiser.errors.full_messages }, status: :unauthorized 
        end
    end

    private
    def organiser_params 
      params.permit(:first_name, :last_name, :password, :email, :phone_number, :age) 
    end

    def authorize_organiser
      return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :organiser_id
    end
end
