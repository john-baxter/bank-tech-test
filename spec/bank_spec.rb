require 'bank.rb'

describe Bank do

  before(:each) do
    @bank = Bank.new
  end
  
  it "has balance" do
    expect(@bank.account_balance).to eq (0.00)
  end

  it "can receive deposits" do
    @bank.deposit(100)
    expect(@bank.account_balance).to eq (100.00)
  end
  



end
