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

    it "raises an error if over top up limit" do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect(subject.top_up 1 }.to raise_error 'Maximum balance of #{maximum_balance} exceeded' 
    end
    describe '#deduct' do
        it "can be able to deduct from oystercard balance" do
            expect(subject).to respond_to(:deduct).with(1).argument
        end

        it "deducts money from oystercard" do
            expect(subject.deduct 1).to change{ subject.balance }.by -1
        end
    end
    
    it "checks oyster card is in journey" do
        expect(subject).not_to be_in_journey
    end

    it "checks oystercard is touched in" do
        subject.touch_in
        expect(subject).to be_in_journey
    end

    it "checks oystercard is touched out" do
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey
    end

    # it "checks oyster card is in journey" do
    #     expect(subject.in_journey?).to eq(true)
    # end

    # it "checks oystercard is touched in" do
    #     expect(subject.touch_in).to eq(:in_journey?)
    # end

    # it "checks oystercard is touched in" do
    #     expect(subject.touch_out).to eq(:in_journey?)
    # end
end