require 'van'

describe Van do
  
  describe "collect_broken_bikes" do
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
end