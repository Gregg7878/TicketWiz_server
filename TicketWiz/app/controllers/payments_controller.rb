# class PaymentsController < ApplicationController
#     before_action :set_payment, only: [:show, :edit, :update, :destroy]
#     before_action :authenticate_user, only: [:create]
    
#     def create
#       @payment = Payment.new(payment_params)

#       if @payment.save
#         # Integrate MPESA Lipa Na M-PESA payment here using Ruby::Daraja
#         daraja_config = Daraja::Default.new._app_config
#         daraja_config[:consumer_key] = 'LLFWMCiS8ZkCmSuy98cwGA5pLccse3uA' # Your consumer key
#         daraja_config[:consumer_secret] = 'aiSrhAOigvxAhR2R' # Your consumer secret
#         paybill_client = Daraja::PayBill.new(config: daraja_config, pass_key: 'your_pass_key') # Replace 'your_pass_key'

#         # Initiate Lipa Na M-PESA payment request
#         response = paybill_client.initiate_stk_push(
#           amount: @payment.amount,
#           phone_number: '2547xxxxxxxx', # Get the phone number from your form or params
#           account_reference: 'account reference',
#           transaction_description: 'transaction description'
#         )

#         if response['ResponseCode'] == '0' # Payment successful
#           @payment.update(status: 'completed', transaction_id: response['CheckoutRequestID'])
#           redirect_to @payment, notice: 'Payment was successfully created.'
#         else
#           @payment.update(status: 'failed')
#           flash[:alert] = 'Payment failed.'
#           render :new
#         end
#       else
#         render :new
#       end
#     end

#     end
    
#     def index
#       @payments = Payment.all
#     end
    
  
#   def index
#     @payments = Payment.all
#     render json: current_user.payments
#   end
  
#   def create
#     @payment = Payment.new(payment_params)
#     @payment.status = 'pending'
#     if @payment.save
#         if payment_successful
#           @payment.calculate_amount
#           @payment.set_as_completed
#         else
#           @payment.set_as_failed
#         end

#         render json: @payment, status: :created
#     else
#       render json: { errors: @payment.errors.full_messages }, status: :unprocessable_entity
#     end
#   end

#   def show
#     render json: @payment, status: :ok
#   end

#   def update
#     if @payment.update(payment_params)
#       render json: { payment: @payment, message: 'Payment was successfully updated.' }, status: :accepted
#     else
#       render :edit
#     end
#   end  

#   def destroy
#     @payment.destroy
#     head :no_content
#   end

#   private

#   def set_payment
#     @payment = Payment.find(params[:id])
#   end

#   def payment_params
#     params.require(:payment).permit(:ticket_id, :amount, :transaction_id, :status, :timestamp)
#   end

#   def payment_successful
#     # remember to implement ot make api call
#     response = call_mpesa_api_to_check_payment 
#     success_keywords = ['confirmed', 'paid', 'sent']
#     response_body = response['body'].downcase
#     success_keywords.any? { |keyword| response_body.include?(keyword) }
#   end
  
#   def authenticate_user
#     unless current_customer || current_organizer
#       render json: { error: "Unauthorized" }, status: :unauthorized
#     end
#   end
# end
