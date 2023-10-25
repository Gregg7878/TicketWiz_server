require "test_helper"

class CustomerMailerTest < ActionMailer::TestCase
  def welcome_email
    CustomerMailer.with(customer: Customer.first).welcome_email
  end
end
