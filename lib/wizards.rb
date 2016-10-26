class Person
attr_reader     :name,
                :level_of_cash,
                :bank_accounts


  def initialize(name, level_of_cash)
    @name = name
    @bank_accounts = []
    @level_of_cash = level_of_cash.to_i
    puts "#{name} has been created with #{@level_of_cash} galleons in cash."

  end

end
