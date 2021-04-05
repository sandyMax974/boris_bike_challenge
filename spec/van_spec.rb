require 'van'

describe Van do
  
  describe "#collect_broken_bikes" do
    it "add the broken bikes to the van storage" do
      bike_broken = double("Bike", :working? => false)
      bike_working = double("Bike", :working? => true)
      docking_one = double("DockingStation", :docking_bay => [bike_broken, bike_working], remove_broken_bike: nil)
      expect{ subject.collect_broken_bikes(docking_one) }.to change{ subject.storage.count }.by(1)
    end
    it "removes the broken bikes from the docking station" do
      bike_broken = double("Bike", :working? => false)
      bike_working = double("Bike", :working? => true)
      docking_one = double("DockingStation", :docking_bay => [bike_broken, bike_working])
      expect(docking_one).to receive(:remove_broken_bike)
      subject.collect_broken_bikes(docking_one)
    end
  end

  describe "#deliver_broken_bikes" do
    it "remove the broken bikesfrom the van storage" do
      bike_broken_one = double("Bike_one", :working? => false)
      bike_broken_two = double("Bike_two", :working? => false)
      garage = double("Garage", :broken_storage => [], receive_broken_bikes: nil)
      subject.storage << bike_broken_one << bike_broken_two
      expect{ subject.deliver_broken_bikes(garage) }.to change{ subject.storage.count }.by(-2)
    end
    it "add the broken bikes to the garage broken storage" do
      bike_broken_one = double("Bike_one", :working? => false)
      bike_broken_two = double("Bike_two", :working? => false)
      garage = double("Garage", :broken_storage => [])
      subject.storage << bike_broken_one << bike_broken_two
      expect(subject).to receive(:remove_broken_bikes)
      expect(garage).to receive(:receive_broken_bikes).twice
      subject.deliver_broken_bikes(garage)
    end
  end

  describe "#collect_working_bikes" do
    it "adds the working bikes to the van storage" do
      bike_fixed_one = double("Bike_one", :working? => true)
      garage = double("Garage", :fixed_storage => [])
      garage.fixed_storage << bike_fixed_one
      allow(garage).to receive(:remove_fixed_bikes)
      expect{ subject.collect_working_bikes(garage) }.to change{ subject.storage.count }.by(1)
    end
    it "removes the working bikes from the garage fixed storage" do
      bike_fixed_one = double("Bike_one", :working? => true)
      garage = double("Garage", :fixed_storage => [])
      garage.fixed_storage << bike_fixed_one
      expect(garage).to receive(:remove_fixed_bikes)
      subject.collect_working_bikes(garage)
    end
  end

  describe "#distribute_working_bikes" do
    it "removes the working bikes from the van storage" do
      bike_working_one = double("Bike_one", :working? => true)
      bike_working_two = double("Bike_two", :working? => true)
      docking_one = double("DockingStation", :docking_bay => [])
      subject.storage << bike_working_one << bike_working_two
      allow(docking_one).to receive(:receive_working_bikes)
      allow(docking_one).to receive(:at_capacity?)
      expect{ subject.distribute_working_bikes(docking_one) }.to change{ subject.storage.count }.by(-2)
    end
    xit "stops delivering bikes to docking_bay if docking is full" do
      bike_working_one = double("Bike_one", :working? => true)
      docking_one = double("DockingStation", :docking_bay => [], :at_capacity? => true)
      subject.storage << bike_working_one
      allow(docking_one).to receive(:receive_working_bikes)
      allow(docking_one).to receive(:at_capacity?).and_return(true)

      expect{ subject.distribute_working_bikes(docking_one) }.not_to change{ subject.storage.count }

    end  
  end
end