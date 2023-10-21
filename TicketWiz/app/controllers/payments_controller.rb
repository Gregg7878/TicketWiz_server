class PaymentsController < ApplicationController
    before_action :set_payment, only: [:show, :edit, :update, :destroy]
    
    def index
      @payments = Payment.all
      render json: @payments
    end
    
  
    def show

        @payments = Payment.find(params[:id])
    end
  
    def new
      @payment = Payment.new
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
  
    def edit
    end
  
    def update
      if @payment.update(payment_params)
        redirect_to @payment, notice: 'Payment was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @payment.destroy
      redirect_to payments_url, notice: 'Payment was successfully destroyed.'
    end
  
    private
  
    def set_payment
      @payment = Payment.find(params[:id])
    end
  
    def payment_params
      params.require(:payment).permit(:ticket_id, :amount, :transaction_id, :status, :timestamp)
    end
  end
  