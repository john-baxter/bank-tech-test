require 'bank.rb'

describe Bank do

  before(:each) do
    @bank = Bank.new
  end
  
  # unit test 1
  it "has balance" do
    expect(@bank.account_balance).to eq (0.00)
  end
  
  # unit test 2
  it "can receive deposits" do
    # not DRY
    @bank.deposit(100)
    expect(@bank.account_balance).to eq (100.00)
  end
  
  # unit test 3
  it "can pay out withdrawals" do
    # not DRY
    @bank.deposit(100)
    @bank.withdraw(50)
    expect(@bank.account_balance).to eq (50)
  end

end

# TO DO
# find a way to not need to have the same line repeated in tests 2 and 3. probably stub mock or double or such.
# otherwise MVP is done.