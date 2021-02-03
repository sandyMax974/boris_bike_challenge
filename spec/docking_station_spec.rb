require 'docking_station'

describe DockingStation do

  describe '#release_bike' do
    it 'should respond_to release_bike' do
      expect(subject).to respond_to :release_bike
    end

    context 'object released from release_bike' do
      subject(:bike) { DockingStation.new.release_bike }

      it { is_expected.to be_an_instance_of Bike }

      it { is_expected.to be_working }
    end
  end

  describe '#dock_bike' do
    # let(:bike) { instance_double(Bike) }
    it 'should respond_to dock_bike with an argument' do
      expect(subject).to respond_to(:dock_bike).with(1)
    end
  end

  describe '#bikes' do
    it 'should display the bikes instance variable' do
      expect(subject.bikes).to be_an_instance_of Array
    end
  end

end
