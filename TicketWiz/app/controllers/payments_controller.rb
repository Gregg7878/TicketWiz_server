class PaymentsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  before_action :set_payment, only: [:show, :update, :destroy]
  
  def index
    @payments = Payment.all
    render json: current_user.payments
  end
  
  def create
    @payment = Payment.new(payment_params)
    @payment.status = 'pending'
    if @payment.save
        if payment_successful
          @payment.calculate_amount
          @payment.set_as_completed
        else
          @payment.set_as_failed
        end

        render json: @payment, status: :created
    else
      render json: { errors: @payment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @payment, status: :ok
  end

  def update
    if @payment.update(payment_params)
      render json: { payment: @payment, message: 'Payment was successfully updated.' }, status: :accepted
    else
      render :edit
    end
  end  

  def destroy
    @payment.destroy
    head :no_content
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:ticket_id, :amount, :transaction_id, :status, :timestamp)
  end

  def payment_successful
    # remember to implement ot make api call
    response = call_mpesa_api_to_check_payment 
    success_keywords = ['confirmed', 'paid', 'sent']
    response_body = response['body'].downcase
    success_keywords.any? { |keyword| response_body.include?(keyword) }
  end
  
  def authenticate_user
    unless current_customer || current_organizer
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
