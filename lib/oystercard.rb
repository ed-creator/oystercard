
class Oystercard

  def initialize()
    @balance = 0
  end

  def return_balance
    balance
  end

  private

  attr_reader :balance


end
