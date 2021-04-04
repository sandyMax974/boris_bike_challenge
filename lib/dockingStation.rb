class DockingStation
  attr_reader :docking_bay, :capacity

  DEFAULT = 20

  def initialize(capacity = DEFAULT)
    @capacity = capacity
    @docking_bay = []
  end

  def release_bike
    no_bike_available_error unless has_bikes?
    dockingbay.pop
  end

  def dock_bike(bike)
    no_dock_available_error unless !at_capacity?
    dockingbay.push(bike)
  end

  def has_bikes?
    !dockingbay.empty?
  end

  def at_capacity?
    dockingbay_count >= @capacity
  end


  # setter method
  def modify_capacity=(capacity)
    @capacity = capacity
  end

  def report_broken(bike)
    bike.broken
  end

  private
  
  def dockingbay
    @docking_bay
  end

  def no_bike_available_error
    fail "No bikes available at docking"
  end

  def no_dock_available_error
    fail "No space available at docking"
  end

  def dockingbay_count
    @docking_bay.count
  end
end
