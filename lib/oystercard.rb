
class Oystercard

  attr_reader :balance, :entry_station

  MAX_LIMIT = 90
  MIN_CHARGE = 1

  def initialize()
    @balance = 0
  end

  def in_journey?
    entry_station != nil
  end

  def touch_in(station)
    fail "Insufficient Balance" unless min_balance?
    self.entry_station = station
  end

  def touch_out
    deduct(MIN_CHARGE)
    self.entry_station = nil
  end

  def top_up(amount)
    fail "Error: Maximum of £#{MAX_LIMIT} stored on card" if over_limit?(amount)
    self.balance += amount
  end

  private

  attr_writer :balance, :entry_station

  def over_limit?(amount)
    (balance + amount) > MAX_LIMIT
  end

  def min_balance?
    balance >= MIN_CHARGE
  end

  def deduct(fare)
    self.balance -= fare
  end

end
