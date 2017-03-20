
  describe "User Stories" do

    let(:oystercard)  { Oystercard.new }

    it "So customer can use public transport allow card to store balance" do
      expect(oystercard).to respond_to :return_balance
# In order to use public transport
# As a customer
# I want money on my card

  end
end
