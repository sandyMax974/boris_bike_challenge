require 'garage'

describe Garage do

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
      bike_broken = double("Bike", :working? => false) 
      expect(bike_broken).to receive(:fixing)
      subject.repair_bike(bike_broken)
    end
  end 

end 