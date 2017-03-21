
class Oystercard

  attr_reader :balance

  MAXIMUM_LIMIT = 80

  def initialize()
    @balance = 0
  end

  def return_balance
    balance
  end

  def top_up(amount)
    fail "Error: Maximum of £#{MAXIMUM_LIMIT} stored on card" if over_limit?(amount)
    self.balance += amount
  end

  def deduct(fare)
    self.balance -= fare
  end

  private

  attr_writer :balance

  def over_limit?(amount)
    (balance + amount) > MAXIMUM_LIMIT
  end

end
