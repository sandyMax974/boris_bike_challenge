require 'docking_station'

describe DockingStation do
  let(:bikes) { subject.bikes }
  let(:bike) { Bike.new }
  let(:docking_station) { subject }

  describe '#release_bike' do
    it 'should respond_to release_bike' do
      expect(subject).to respond_to :release_bike
    end

    it 'prompt error to user when bike array is empty' do
      docking_station.bikes.clear
      expect {docking_station.release_bike}.to raise_error("no bikes available")
    end

    it 'should be an instance of bike class' do
      expect(docking_station.release_bike).to be_an_instance_of Bike
    end

    it 'bike should be working' do
      expect(docking_station.release_bike).to be_working
    end
  end

  describe '#dock_bike' do
    let(:bike) { instance_double(Bike) }
    it 'should respond_to dock_bike with an argument' do
      expect(subject).to respond_to(:dock_bike).with(1)
    end

    context 'when capacity is full' do
      it 'raises exception' do
        allow(docking_station).to receive(:bikes) { Array.new(20) {Bike.new} }
        expect { docking_station.dock_bike(bike) }.to raise_error 'Capacity full'
      end
    end

    context 'when capacity is not full' do
      it 'doesnt raise error' do
        docking_station.bikes.clear
        allow(docking_station).to receive(:bikes) { Array.new(19) {Bike.new} }
        expect { docking_station.dock_bike(bike) }.to_not raise_error
      end
    end

    it 'stores bike in bikes' do
      bikes.clear
      subject.dock_bike(bike)
      expect(bikes.count).to eq 1
    end
  end

  describe '#bikes' do
    it 'should display the bikes instance variable' do
      expect(bikes).to be_an_instance_of Array
    end

    it 'should be empty on initialization' do
      expect(bikes).to be_empty
    end
  end

  describe '#bike_docked?' do
    it 'returns false if bikes is empty' do
      docking_station.bikes.clear
      expect(docking_station.bike_docked?).to be false
    end
  end
end
