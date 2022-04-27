class Oystercard

  MAXIMUM_BALANCE = 90
  
  attr_reader :balance
  attr_accessor :in_use

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail 'Maximum balance is exceeded (£90)' if amount + balance > MAXIMUM_BALANCE
    @balance = @balance + amount
  end

  def deduct(amount)
    @balance = @balance - amount  
  end

  def in_journey?
    @in_use = false
    # was true before (check commented out spec)
  end

  def touch_in
   !@in_use
   fail "insufficient funds to touch in"
   balance < 1
   # was in_use before (check commented out spec)
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @in_use
    # was !in_use before (check commented out spec)
  end
end