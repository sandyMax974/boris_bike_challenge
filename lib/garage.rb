class Garage
attr_reader :broken_storage, :fixed_storage
  def initialize
    @broken_storage = []
    @fixed_storage = []
  end

  def broken_storage
    @broken_storage
  end
  def fixed_storage
    @fixed_storage
  end

  def repair_bikes
    broken_storage.each { |bike| fixed_storage << bike.fixing }
    @broken_storage.clear
  end

private 

  def receive_broken_bikes(bike)
    @broken_storage << bike if !bike.working?
  end

  def remove_fixed_bikes
    @fixed_storage.clear
  end
end 