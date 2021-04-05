class Van
attr_reader :storage

  def initialize
    @storage = []
  end

  def collect_broken_bikes(docking_station)
    docking_station.docking_bay.each { |bike| @storage << bike if !bike.working? }
    docking_station.remove_broken_bike
  end

  def deliver_broken_bikes(garage)
    @storage.each { |bike| garage.receive_broken_bikes(bike) }
    remove_broken_bikes
  end

  def collect_working_bikes(garage)
    garage.fixed_storage.each { |bike| @storage << bike if bike.working? }
  end 

private
  def remove_broken_bikes
    @storage.delete_if { |bike| !bike.working? }
  end
  
end