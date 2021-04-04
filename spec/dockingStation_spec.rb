require 'dockingStation'

describe DockingStation do
  describe "#release_bike" do
    it "should remove a bike from the docking bay" do
      bike = double("Bike")
      subject.dock_bike(bike)
      expect{ subject.release_bike }.to change{ subject.docking_bay.count }.by(-1)
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
    it "should return true if there are bikes in the docking bay" do
      bike = double("Bike")
      subject.dock_bike(bike)
      expect(subject.has_bikes?).to be true
    end
    it "should return false if there are no bike in the docking bay" do
      expect(subject.has_bikes?).to be false
    end
  end
end