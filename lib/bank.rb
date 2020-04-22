class Bank

  attr_reader :account_balance, :transactions

  def initialize
    @account_balance = 0.00
    @transactions = []
  end

  def deposit(in_payment)
    @account_balance += in_payment
    @transactions.push(in_payment)
  end
  
  def withdraw(out_payment)
    @account_balance -= out_payment
    @transactions.push(out_payment)
  end

end
