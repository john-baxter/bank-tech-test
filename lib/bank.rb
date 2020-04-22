require 'Date'

class Bank

  attr_reader :account_balance, :transactions

  def initialize
    @account_balance = 0.00
    @transactions = []
  end

  def deposit(in_payment)
    adjust_balance("+", in_payment)
    update_transactions(in_payment, "")
  end
  
  def withdraw(out_payment)
    adjust_balance("-", out_payment)
    update_transactions("", out_payment)
  end

  def update_transactions(credit, debit)
    @transactions.push({date: Time.now, credit: credit, debit: debit})
  end

  def adjust_balance(mathematical_operator, money)
    @account_balance += money if mathematical_operator == "+"
    @account_balance -= money if mathematical_operator == "-"
  end

end
