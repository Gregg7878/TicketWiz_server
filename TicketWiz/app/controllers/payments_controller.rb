class PaymentsController < ApplicationController
    before_action :set_payment, only: [:show, :edit, :update, :destroy]
    
    def create
      @payment = Payment.new(payment_params)

      if @payment.save
        # Integrate MPESA Lipa Na M-PESA payment here using Ruby::Daraja
        daraja_config = Daraja::Default.new._app_config
        daraja_config[:consumer_key] = 'LLFWMCiS8ZkCmSuy98cwGA5pLccse3uA' # Your consumer key
        daraja_config[:consumer_secret] = 'aiSrhAOigvxAhR2R' # Your consumer secret
        paybill_client = Daraja::PayBill.new(config: daraja_config, pass_key: 'your_pass_key') # Replace 'your_pass_key'

    end
    
    def index
      @payments = Payment.all
    end
    
  
    def show

        @payments = Payment.find(params[:id])
    end
  
    def new
      @payment = Payment.new
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
  