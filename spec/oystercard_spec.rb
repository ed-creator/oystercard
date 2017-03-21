require 'oystercard'

describe Oystercard do
  subject(:oystercard)  {described_class.new}

  describe '#initialize' do
    it "card initialized with 0 balance" do
      expect(oystercard.balance).to eq 0
    end

    it 'card is initially not in a journey' do
      expect(oystercard).not_to be_in_journey
    end
  end

  describe '#top_up' do
    it 'tops up with a user defined amount' do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end

    it 'can top up the balance' do
    expect{oystercard.top_up(1)}.to change{oystercard.balance}.by 1
    end

    it "To protect the user the card should have a maxium of £90" do
      maximum_balance = described_class::MAX_LIMIT
      message = "Error: Maximum of £#{maximum_balance} stored on card"
      oystercard.top_up(maximum_balance)
      expect{oystercard.top_up(1)}.to raise_error message
    end
  end

  describe '#in_journey?' do
    it 'expects in_journey? to return true or false' do
      logic = [true,false]
      expect(logic).to include oystercard.in_journey?
    end
  end

  describe '#touch_in' do
    it 'expects touch_in to change in_journey? to true' do
      min_charge = described_class::MIN_CHARGE
      oystercard.top_up(min_charge)
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq true
    end

    it 'checks the user has over the minimum balance' do
      expect{oystercard.touch_in}.to raise_error "Insufficient Balance"
    end
  end

  describe '#touch_out' do
    it 'expects touch_out to change in_journey? to false' do
      min_charge = described_class::MIN_CHARGE
      oystercard.top_up(30)
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey?).to eq false
    end

    it 'checks touch_out deducts balance by fare' do
      min_charge = described_class::MIN_CHARGE
      oystercard.top_up(30)
      oystercard.touch_in
      expect{oystercard.touch_out}.to change{oystercard.balance}.by -min_charge
    end
  end

end
