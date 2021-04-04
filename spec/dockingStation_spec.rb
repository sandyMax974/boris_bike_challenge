require 'dockingStation'

describe DockingStation do

  describe "#release_bike" do
    it "should remove a bike from the docking bay" do
      bike = double("Bike")
      subject.dock_bike(bike)
      expect{ subject.release_bike }.to change{ subject.docking_bay.count }.by(-1)
    end
    it "should not release a bike if there are none" do
      error = "No bikes available at docking"
      expect{ subject.release_bike }.to raise_error(error)
    end
  end

  describe "#dock_bike" do
    it "should add a bike to the docking bay" do
      bike = double("Bike")
      expect{ subject.dock_bike(bike) }.to change{ subject.docking_bay.count }.by(1)
      expect(subject.docking_bay).to include(bike)
    end
  end

  describe "#has_bikes?" do
    it "returns true if there are bikes in the docking bay" do
      bike = double("Bike")
      subject.dock_bike(bike)
      expect(subject.has_bikes?).to be true
    end
    it "returns false if there are no bike in the docking bay" do
      expect(subject.has_bikes?).to be false
    end
  end

  describe "#at_capacity?" do
    it "returns true if the maximum number of bikes is docked" do
      error = "No space available at docking"
      bike = double("Bike")
      20.times { subject.dock_bike(bike) }
      expect(subject.at_capacity?).to be true
      expect{ subject.dock_bike(bike) }.to raise_error(error)
    end
  end

  describe "#modify_capacity" do
    it "modifies the docking station capacity to the specifies integer" do
      subject.modify_capacity=(10)
      expect(subject.capacity).to eq 10 
    end
  end
end