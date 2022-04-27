class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1
  
  attr_reader :balance, :entry_station
  attr_accessor :in_use

  def initialize
    @balance = 0
    
    @entry_station = nil
  end

  def top_up(amount)
    fail 'Maximum balance of #{MAXIMUM_BALANCE} exceeded' if amount + balance > MAXIMUM_BALANCE
    @balance = @balance + amount
  end

  def deduct(amount)
    @balance = @balance - amount  
  end

  def in_journey?
    @entry_station
    # was true before (check commented out spec)
  end

  def touch_in(station)
   fail "insufficient funds to touch in" if balance < 1
   fail "card still in use, has not been touched out" if in_journey?
   #@in_use = true
   # was in_use before (check commented out spec)
   @entry_station = station
  end

  def touch_out
    fail "card was not touched in" if !in_journey?
    deduct(MINIMUM_CHARGE)
    #@in_use = false
    # was !in_use before (check commented out spec)
    @entry_station = nil
  end
end