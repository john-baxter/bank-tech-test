require 'bank.rb'

describe Bank do

  it "has balance" do
    bank = Bank.new
    expect(bank.account_balance).to eq (0.00)
  end


end
