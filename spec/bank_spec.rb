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
    expect(@bank.transactions).to include(100)
  end

end
