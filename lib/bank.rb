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
    # pass empty string to populate :debit column with nothing; as per acceptance criteria
  end
  
  def withdraw(out_payment)
    adjust_balance("-", out_payment)
    update_transactions("", out_payment)
    # pass empty string to populate :credit column with nothing; as per acceptance criteria
  end

  def update_transactions(credit, debit)
    timestamp = Time.now.to_a
    datestring = "#{timestamp[3].to_s.rjust(2, '0')}/#{timestamp[4].to_s.rjust(2, '0')}/#{timestamp[5].to_s.rjust(4, '0')}"
    @transactions.push({date: datestring, credit: credit, debit: debit, balance: @account_balance})
  end

  def adjust_balance(mathematical_operator, money)
    @account_balance += money if mathematical_operator == "+"
    @account_balance -= money if mathematical_operator == "-"
  end

end
