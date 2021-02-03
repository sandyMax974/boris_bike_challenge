require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = [Bike.new]
  end

  def release_bike
    raise "no bikes available" unless bike_docked?
    bikes.first
  end

  def dock_bike(bike)
    bikes << bike
  end

  def bike_docked?
    !bikes.empty?
  end
end
