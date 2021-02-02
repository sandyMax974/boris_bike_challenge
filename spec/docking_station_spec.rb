require './lib/docking_station.rb'

describe DockingStation do

  describe '#release_to' do
    it "should respond_to release_bike" do
      expect(subject).to respond_to :release_bike
    end
  end

end
