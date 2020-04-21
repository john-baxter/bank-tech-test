require './lib/bank.rb'

bank = Bank.new
bank.account_balance
bank.deposit(100)
bank.withdraw(50)
bank.print_statement
