require 'Oystercard'

describe Oystercard do

    it "checks oystercard has a balance" do
        oystercard = Oystercard.new
        expect(subject.balance).to eq(0)
    end

    describe '#top_up' do
        it "can be able to top-up oystercard balance" do
            expect(subject).to respond_to(:top_up).with(1).argument
        end

        it "can top up balance" do
            expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
        end

    end
    
    
    # expect(subject).to respond_to(:balance).with(1).argument   

end