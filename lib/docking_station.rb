require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    bikes << bike
  end

  def bike_docked?
    !bikes.empty?
  end
end
