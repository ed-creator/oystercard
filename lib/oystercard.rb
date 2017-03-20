
class Oystercard



  def initialize()
    @balance = 0
  end

  def return_balance
    balance
  end

  def top_up(amount)
    self.balance = balance + amount
  end

  private

  attr_writer :balance
  attr_reader :balance



end
