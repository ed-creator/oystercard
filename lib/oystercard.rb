
class Oystercard

  attr_reader :balance, :entry_station, :journey_history

  MAX_LIMIT = 90
  MIN_CHARGE = 1

  def initialize()
    @balance = 0
    @journey_history = []
  end

  def touch_in(station)
    fail "Insufficient Balance" unless min_balance?
    self.entry_station = station
  end

  def touch_out(station)
    deduct(MIN_CHARGE)
    journey_compiler(entry_station, station)
    self.entry_station = nil
  end

  def top_up(amount)
    fail "Error: Maximum of £#{MAX_LIMIT} stored on card" if over_limit?(amount)
    self.balance += amount
  end

  def in_journey?
    !!entry_station
  end

  private

  attr_writer :balance, :entry_station

  def journey_compiler(entry_station, exit_station)
    journey_history << {entry_station => exit_station}
  end

  def over_limit?(amount)
    balance + amount > MAX_LIMIT
  end

  def min_balance?
    balance >= MIN_CHARGE
  end

  def deduct(fare)
    self.balance -= fare
  end

end
