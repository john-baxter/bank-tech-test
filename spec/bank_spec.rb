require 'bank.rb'

describe Bank do
  
  before(:each) do
    @bank = Bank.new
  end
  
  # unit test 1
  it "has balance" do
    expect(@bank.account_balance).to eq (0.00)
  end
  
  describe '#deposit' do
  # unit test 2
  it "can receive deposits" do
    @bank.deposit(100)
    expect(@bank.account_balance).to eq (100.00)
  end
end

describe '#withdraw' do

before(:each) do
  @bank.send(:deposit, 100)
end

# unit test 3
it "can pay out withdrawals" do
  @bank.withdraw(50)
  expect(@bank.account_balance).to eq (50)
end

end

# unit test 4
it "has a way to store transactions" do
  expect(@bank.transactions).not_to be_nil
end

# unit test 5
it "actually stores transactions" do
  @bank.deposit(100)
  expect(@bank.transactions[0][:credit]).to eq (100)
end

# unit test 6
it "stores withdrawals too" do
  @bank.deposit(100)
  @bank.withdraw(50)
  expect(@bank.transactions[0][:credit]).to eq (100)
  expect(@bank.transactions[1][:debit]).to eq (50)
end

# unit test 7
it "has a datestamp with the transaction amount" do
  @bank.deposit(100)
  expect(@bank.transactions[0][:date]).eql? '^(0[1-9]|[1-2][0-9]|3[1-2])/(0[1-9]|1[1-2])/(202[0-9]$'
  # use regex to match the specified date format in some tests
end

# unit test 8
it "includes balance in its tracking of transactions" do
    @bank.deposit(100)
    expect(@bank.transactions[0][:balance]).not_to be_nil
  end
  
  # unit test 9
  it "actually includes the correct balance when tracking transactions" do
    @bank.deposit(100)
    @bank.withdraw(50)
    expect(@bank.transactions[0][:balance]).to eq (100)
    expect(@bank.transactions[1][:balance]).to eq (50)
  end
  
  # unit test 10
  it "can print the customer's statement" do
    expect(@bank).to respond_to(:print_statement)
  end
  
  # unit test 11 v2
  # updated to reflect testing for puts rather than return
  it "can actually print the statement" do
    expect do
      @bank.deposit(100)
      @bank.withdraw(50)
      @bank.print_statement
    end.to output(/date || credit || debit || balance/).to_stdout
  end
  
  # unit test 12
  # also updated to reflect testing puts
  it "contains the transaction information in the statement" do
    expect do
      @bank.deposit(100)
      @bank.withdraw(50)
      @bank.print_statement
    end.to output(/#{@bank.get_date} || 100.00 || || 100.00/).to_stdout
  end
  
  # unit test 13
  it "contains the second line of the transaction statement too" do
    expect do
      @bank.deposit(100)
      @bank.withdraw(50)
      @bank.print_statement
    end.to output(/#{@bank.get_date} || 50.00 || || 50.00/).to_stdout
  end

end
