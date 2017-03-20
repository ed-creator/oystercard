require 'oystercard'

describe Oystercard do
  subject(:oystercard)  { described_class.new }
  describe '#initialize' do
    it "card initialized with 0 balance" do
      expect(oystercard.return_balance).to eq 0
    end
  end
end
