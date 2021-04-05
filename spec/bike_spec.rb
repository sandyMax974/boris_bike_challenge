require 'bike'

describe Bike do 

  describe "#working?" do
    it "return true if the bike is working" do
      expect(subject.working?).to be true
    end
  end

  describe "#broken" do
    it "change the bike status to broken" do
      subject.broken
      expect(subject.working?).to be false
    end
  end

  describe "#fixing" do
    it "change the bike status to working" do
      subject.broken
      subject.fixing
      expect(subject.working?).to be true
    end
  end
end