require 'docking_station'

describe DockingStation do

  describe '#release_bike' do
    it "should respond_to release_bike" do
      expect(subject).to respond_to :release_bike
    end

    context 'object released from release_bike' do
      subject(:bike) { DockingStation.new.release_bike }

      it { is_expected.to be_an_instance_of Bike }

      it { is_expected.to be_working }
    end
  end
end
