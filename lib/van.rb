class Van
attr_reader :storage

  def initialize
    @storage = []
  end

  def collect_broken_bikes(docking_station)
    docking_station.docking_bay.each { |bike| @storage << bike if !bike.working? }
    docking_station.remove_broken_bike
  end

end