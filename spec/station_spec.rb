require 'station'

describe Station do
  subject(:station) {described_class.new("Old Street",1)}

  describe '#initialize' do
    it 'station has a name when created' do
      expect(station.name).to eq "Old Street"
    end

    it 'station has a zone when created' do
      expect(station.zone).to eq 1
    end
  end

end
