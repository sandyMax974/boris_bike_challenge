require 'van'

describe Van do
  let!(:working_bike) { double :bike, :working? => true }  
  let!(:working_bike_two) { double :bike, :working? => true }  
  let!(:broken_bike) { double :bike, :working? => false }  
  let!(:broken_bike_two) { double :bike, :working? => false }  
  let!(:docking) { double :docking_station, :docking_bay => [working_bike, broken_bike], :receive_working_bikes => working_bike_two, at_capacity?: false, remove_broken_bike: true }
  let!(:garage) { double :garage, :broken_storage => [], :fixed_storage => [], receive_broken_bikes: true }
  let!(:full_docking) { double :docking_station, at_capacity?: true, :receive_working_bikes => true }
  
  describe "#collect_broken_bikes" do
    it "add the broken bikes to the van storage" do
      expect{ subject.collect_broken_bikes(docking) }.to change{ subject.storage.count }.by(1)
    end
    it "removes the broken bikes from the docking station" do
      expect(docking).to receive(:remove_broken_bike)
      subject.collect_broken_bikes(docking)
    end
  end

  describe "#deliver_broken_bikes" do
    before (:each) do
      subject.storage << broken_bike << broken_bike_two
    end

    it "remove the broken bikes from the van storage" do
      expect{ subject.deliver_broken_bikes(garage) }.to change{ subject.storage.count }.by(-2)
    end
    it "add the broken bikes to the garage broken storage" do
      expect(subject).to receive(:remove_broken_bikes)
      expect(garage).to receive(:receive_broken_bikes).twice
      subject.deliver_broken_bikes(garage)
    end
  end

  describe "#collect_working_bikes" do

    before (:each) do
      garage.fixed_storage << working_bike
    end

    it "adds the working bikes to the van storage" do
      allow(garage).to receive(:remove_fixed_bikes)
      expect{ subject.collect_working_bikes(garage) }.to change{ subject.storage.count }.by(1)
    end
    it "removes the working bikes from the garage fixed storage" do
      expect(garage).to receive(:remove_fixed_bikes)
      subject.collect_working_bikes(garage)
    end
  end

  describe "#distribute_working_bikes" do
    it "removes the working bikes from the van storage" do
      subject.storage << working_bike << working_bike_two
      expect{ subject.distribute_working_bikes(docking) }.to change{ subject.storage.count }.by(-2)
    end
    it "stops delivering bikes to docking_bay if docking is full" do
      subject.storage << working_bike
      expect{ subject.distribute_working_bikes(full_docking) }.not_to change{ subject.storage.count }
    end  
  end
end