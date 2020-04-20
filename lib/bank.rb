class Bank

  attr_reader :account_balance

  def initialize
    @account_balance = 0.00
  end

  def deposit(in_payment)
    @account_balance += in_payment
  end



end
