require 'docking_station'

describe DockingStation do
  let(:bikes) { subject.bikes }

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
    let(:bike) { instance_double(Bike) }
    it 'should respond_to dock_bike with an argument' do
      expect(subject).to respond_to(:dock_bike).with(1)
    end

    it 'stores bike in bikes' do
      count = bikes.count
      subject.dock_bike(bike)
      expect(bikes.count).to eq(count + 1)
    end

    it 'stores bike when we have bikes already docked' do
      5.times { subject.dock_bike(bike) }
      count = bikes.count
      subject.dock_bike(bike)
      expect(bikes.count).to eq(count + 1)
    end
  end

  describe '#bikes' do
    it 'should display the bikes instance variable' do
      expect(bikes).to be_an_instance_of Array
    end
  end

  describe '#bike_docked?' do
    it 'returns false if bikes is empty' do
      expect(subject.bike_docked?).to be false
    end
  end
end
