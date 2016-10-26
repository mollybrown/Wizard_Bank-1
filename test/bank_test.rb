gem 'minitest'
require_relative '../lib/bank.rb'
require 'minitest/autorun'
require 'minitest/pride'

class BankTest < Minitest::Test
  def test_bank_exists
    assert_instance_of Bank, Bank.new("JP Morgan")
  end

  def test_can_open_account
    bank = Bank.new("JP Morgan")
    assert_equal "An account has been opened for Mary with JP Morgan.", open_account("Mary")
  end

  def test_can_deposit
    bank = Bank.new("JP Morgan")
    assert equal 500, bank.deposit(500)
  end

  def test_can_withdraw
    bank = Bank.new("JP Morgan")
    bank.deposit(500)
    assert equal 200, bank.withdrawal(300)
  end

  def test_can_transfer
    bank = Bank.new("JP Morgan")
    bank.deposit(500)
    assert_equal 200, bank.transfer("Mary", "Wells Fargo", 300)
  end
end
