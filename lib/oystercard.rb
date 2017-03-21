
class Oystercard

  attr_reader :balance, :in_journey

  MAXIMUM_LIMIT = 90

  def initialize()
    @balance = 0
    @in_journey = false
  end

  def in_journey?
    in_journey
  end

  def touch_in
    fail "Insufficient Balance" unless min_balance?
    self.in_journey = true
  end

  def touch_out
    self.in_journey = false
  end


  def top_up(amount)
    fail "Error: Maximum of £#{MAXIMUM_LIMIT} stored on card" if over_limit?(amount)
    self.balance += amount
  end

  def deduct(fare)
    self.balance -= fare
  end

  private

  attr_writer :balance, :in_journey

  def over_limit?(amount)
    (balance + amount) > MAXIMUM_LIMIT
  end

  def min_balance?
    balance >= 1
  end

end
