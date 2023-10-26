require "test_helper"

class CustomerMailerTest < ActionMailer::TestCase
  def welcome_email
    CustomerMailer.with(customer: Customer.first).welcome_email
  end

  test "welcome_email" do
    email = welcome_email

    assert_emails 1
    assert_email(email) do
      assert_equal ["your_email@TicketWiz.com"], email.to
      assert_equal "Welcome to TicketWiz", email.subject
  
    end
  end
end
