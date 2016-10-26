require 'pry'
require './wizards.rb'

class Bank
attr_reader     :bank_name,
                :open_account,
                :deposit,
                :balance,
                :total_cash


  def initialize(bank_name)
    @bank_name = bank_name
    puts "#{bank_name} has been created."
    @balance = 0
  end

  def open_account(person)
      person.bank_accounts << bank_name
      puts "An account has been opened for #{person.name} with #{@bank_name}."
  end

  def deposit(person, deposit_amount)
      if person.level_of_cash < deposit_amount
          puts "#{person.name} doesn't have enough cash to perform this deposit"
      else
        @balance += deposit_amount
        @total_cash = person.level_of_cash - deposit_amount
        "#{deposit_amount} galleons have been deposited into #{person.name}'s #{bank_name}. Balance: #{@balance} Cash: #{@total_cash} "
      end
      @balance
  end

  def withdrawal(person, withdrawal_amount)
    if @balance < withdrawal_amount
      puts "Insuffient funds."
    else
      @balance -= withdrawal_amount
      @total_cash = person.level_of_cash + withdrawal_amount
        puts "#{person.name} has withdrawn #{withdrawal_amount} galleons. Balance: #{@balance}"
    end
    @balance
  end

  def transfer(person, transfer_bank, transfer_amount)
      if transfer_amount > @balance
          puts "Insufficient funds."
      elsif person.bank_accounts.include?(transfer_bank_name) && transfer_amount <= @balance
          @balance -= transfer_amount
          puts "#{person.name} has transferred #{transfer_amount} galleons from #{@bank_name} to {transfer_bank_name}."
      else
          puts "#{person.name} does not have an account with #{transfer_bank_name}."
      end
      @balance
  end
end

person = Person.new("Mary", 1000)
bank = Bank.new("JP Morgan")
binding.pry
bank.open_account(person)
bank.deposit(person, 500)
bank.withdrawal(person, 100)
