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
    @transactions.push({date: get_date, credit: credit, debit: debit, balance: @account_balance})
  end
  
  def adjust_balance(mathematical_operator, money)
    @account_balance += money if mathematical_operator == "+"
    @account_balance -= money if mathematical_operator == "-"
  end
  
  def get_date
    timestamp = Time.now.to_a
    datestring = "#{timestamp[3].to_s.rjust(2, '0')}/#{timestamp[4].to_s.rjust(2, '0')}/#{timestamp[5].to_s.rjust(4, '0')}"
  end

  def print_statement
    puts print_statement_header(@transactions)
    counter = 0
    while (counter < @transactions.length) do
      puts print_statement_line(@transactions, counter)
      counter += 1
    end
  end

  def print_statement_header(array)
    return "No transactions to list" if array == []
    header_string = ""
    if array[0].class == Hash
      array[0].each do |key, value|
        header_string << "#{key.to_s} "
      end
      header_string.rstrip!.gsub!(" ", " || ")
      return header_string
    end
  end
  
  def print_statement_line(array, counter)
    line_string = ""
    if array[0].class == Hash
      array[counter].each do |key, value|
        case value
        when String
          line_string << "#{value} "
        when Integer
          line_string << "#{sprintf '%.2f', value} "
        when Float
          line_string << "#{sprintf '%.2f', value} "
        end
      end
        line_string.rstrip!.gsub!(" ", " || ").gsub!("  ", " ")
        return line_string
    end
  end

end
