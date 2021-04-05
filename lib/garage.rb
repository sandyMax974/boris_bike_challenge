class Garage

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

  def repair_bike(bike)
    bike.fixing
  end

  def receive_broken_bikes(bike)
    @broken_storage << bike if !bike.working?
  end
end 