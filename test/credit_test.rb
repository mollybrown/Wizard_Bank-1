gem 'minitest'
require_relative '../lib/credit.rb'
require 'minitest/autorun'
require 'minitest/pride'

class CreditTest < Minitest::Test

  def test_credit_exists
    assert_instance_of Credit, Credit.new("AMEX")
  end

  def test_credit_can_open
    credit = Credit.new("AMEX")
    assert_equal "#{person.name} has opened a credit card with #{credit_card_name} with a credit limit
      of #{credit_limit} and a(n) #{interest_rate} interest rate."
    assert_equal   "Mary has opened a credit card with AMEX with a credit limit
      of 500 and a(n) 0.05 interest rate.", Credit.open_credit("Mary", 500, 0.05)
  end

  def test_it_can_borrow_money
    credit = Credit.new("AMEX")
    assert equal 500, credit.borrow_money("Mary", 500)
  end

  def test_it_pays_down_balance
    credit = Credit.new("AMEX")
    credit.borrow_money("Mary", 500)
    assert_equal 200, credit.pay_down_balance("Mary", 300)
  end
end
