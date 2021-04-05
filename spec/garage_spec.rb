require 'garage'

describe Garage do
  let!(:working_bike) { double :bike, :working? => true }  
  let!(:broken_bike) { double :bike, :working? => false, :fixing => 'fixed_bike' }  

  describe '#broken_storage' do
    it "contains all the broken bikes delivered by the van" do
      expect(subject.broken_storage).to be_an_instance_of Array
    end
  end

  describe '#fixed_storage' do
    it "contains all the fixed bikes to be collected by the van" do
      expect(subject.fixed_storage).to be_an_instance_of Array
    end
  end

  describe "#repair_bike" do
    it "calls the fixing method on the bike" do
      subject.broken_storage << broken_bike
      expect(broken_bike).to receive(:fixing)
      subject.repair_bikes
    end
    it "moves the repaired bikes in the fixed storage" do
      subject.broken_storage << broken_bike
      subject.repair_bikes
      expect(subject.fixed_storage).to include('fixed_bike')
      expect(subject.broken_storage).not_to include(broken_bike)
    end
  end 

end 