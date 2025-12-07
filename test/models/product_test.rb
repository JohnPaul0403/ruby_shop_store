require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "sends email notifications when back in stock" do
    product = products(:tshirt)

    # Getting out-of-stock state
    product.update(inventory_count: 0)

    # Testing if emails are send once back to stock
    assert_emails 2 do
      product.update(inventory_count: 10)
    end
  end
end
