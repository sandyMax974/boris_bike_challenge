require 'dockingStation'

describe DockingStation do

let!(:working_bike) { double :bike, :working? => true }  
let!(:broken_bike) { double :bike, :working? => false }  

  describe "#release_bike" do
    it "should remove a bike from the docking bay" do
      subject.dock_bike(working_bike)
      expect{ subject.release_bike }.to change{ subject.docking_bay.count }.by(-1)
    end
    it "should not release a bike if there are none" do
      error = "No bikes available at docking"
      expect{ subject.release_bike }.to raise_error(error)
    end
    it "should not release a bike if it is broken" do
      subject.dock_bike(broken_bike)
      expect(subject.release_bike).to be_nil
    end
  end

  describe "#dock_bike" do
    context "when the docked bike is working" do
      it "should add a bike to the docking bay" do
        expect{ subject.dock_bike(working_bike) }.to change{ subject.docking_bay.count }.by(1)
        expect(subject.docking_bay).to include(working_bike)
      end
    end
    context "when the docked bike is broken" do
      it "should add a bike to the docking bay" do
        expect{ subject.dock_bike(broken_bike) }.to change{ subject.docking_bay.count }.by(1)
        expect(subject.docking_bay).to include(broken_bike)
      end
    end
  end

  describe "#has_bikes?" do
    it "returns true if there are bikes in the docking bay" do
      subject.dock_bike(working_bike)
      expect(subject.has_bikes?).to be true
    end
    it "returns false if there are no bike in the docking bay" do
      expect(subject.has_bikes?).to be false
    end
  end

  describe "#at_capacity?" do
    it "returns true if the maximum number of bikes is docked" do
      error = "No space available at docking"
      20.times { subject.dock_bike(working_bike) }
      expect(subject.at_capacity?).to be true
      expect{ subject.dock_bike(working_bike) }.to raise_error(error)
    end
  end

  describe "#modify_capacity" do
    it "modifies the docking station capacity to the specifies integer" do
      subject.modify_capacity=(10)
      expect(subject.capacity).to eq 10 
    end
  end

  describe "#report_broken" do
    it "change the broken status of the returned bike" do
      expect(working_bike).to receive(:broken)
      subject.report_broken(working_bike)
    end
  end

  describe "#receive_working_bikes" do
    it "adds working bikes to the docking_bay" do
      expect{ subject.receive_working_bikes(working_bike) }.to change{ subject.docking_bay.count}.by(1)
    end
  end
end