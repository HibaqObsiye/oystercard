require_relative 'Oystercard'

describe Oystercard do

    it "checks oystercard has a balance" do
        oystercard = Oystercard.new
        expect(subject.balance).to eq(0)
    end
    
    #  expect(subject).to respond_to(:balance).with(1).argument   
end

