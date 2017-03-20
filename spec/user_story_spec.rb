
  describe "User Stories" do

    let(:oystercard)  { Oystercard.new }

    # In order to use public transport
    # As a customer
    # I want money on my card
    it "So customer can use public transport allow card to store balance" do
      expect(oystercard).to respond_to :return_balance

    end

    # In order to keep using public transport
    # As a customer
    # I want to add money to my card
    it "So customer can use public transport allow card to be toped up" do
      oystercard.top_up(20)
      expect(oystercard.return_balance).to eq 20
    end

    # In order to protect my money from theft or loss
    # As a customer
    # I want a maximum limit (of £90) on my card
    it "To protect the user the card should have a maxium of £90" do
      expect {oystercard.top_up(91)}.to raise_error "Error: Maximum of £90 stored on card: You can add £90"


    end
end
