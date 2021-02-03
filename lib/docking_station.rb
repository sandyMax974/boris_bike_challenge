require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = [Bike.new]
  end

  def release_bike
    availability_error
    bikes.first
  end

  def availability_error
    raise "no bikes available" unless bike_docked?
  end

  def dock_bike(bike)
    capacity_error
    bikes << bike
  end

  def capacity_error
    raise 'Capacity full' if bike_docked?
  end

  def bike_docked?
    !bikes.empty?
  end
end
