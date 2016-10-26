require './bank.rb'
require './person.rb'
require 'pry'

class Credit

  def initialize(credit_card_name)
    @credit_card_name = credit_card_name
  end

  def open_credit(person, credit_limit, interest_rate)
    puts "#{person.name} has opened a credit card with #{credit_card_name} with a credit limit
    of #{credit_limit} and a(n) #{interest_rate} interest rate."
  end

  def borrow_money(person, borrowed_amount)
    if borrowed_amount > credit_limit
    puts "Cannot process. #{person.name} is over credit limit."
    else
      credit_limit -= borrowed_amount
      @credit_balance += borrowed_amount
    end
    @credit_balance
  end

  def pay_down_balance(person, pay_off)
    if pay_off > person.level_of_cash
      puts "#{person.name} does not have enough money to pay down this balance."
    else
      @credit_balance -= pay_off
    end
    @credit_balance
  end

end
