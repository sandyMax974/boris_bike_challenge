require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
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
    raise 'Capacity full' if capacity_check?
  end

  def capacity_check?
    bikes.count >= 20
  end

  def bike_docked?
    !bikes.empty?
  end
end
