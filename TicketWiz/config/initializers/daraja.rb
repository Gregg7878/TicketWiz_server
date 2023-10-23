require 'ruby-daraja'

Daraja::AppConfig.configure do |config|
    # mandatory variables
    config.consumer_key = 'LLFWMCiS8ZkCmSuy98cwGA5pLccse3uA'
    config.consumer_secret = 'aiSrhAOigvxAhR2R'
    #optional variables
    config.short_code = 'Your PayBill or Till Number'  # Replace with your actual PayBill or Till number
    config.is_sandbox = true  # Set to 'true' for sandbox or 'false' for production
    config.validation_url = 'Your C2B Validation URL'  # Replace with your actual C2B Validation URL
    config.confirmation_url = 'Your C2B Confirmation URL'  # Replace with your actual C2B Confirmation URL
  end