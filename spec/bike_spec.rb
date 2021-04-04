require 'bike'

describe Bike do 

  describe "#working?" do
    it "return true if the bike is working" do
      expect(subject.working?).to be true
    end
  end

  describe "#broken" do
    it "change the biek status to broken" do
      subject.broken
      expect(subject.broken).to be true
    end
  end
end