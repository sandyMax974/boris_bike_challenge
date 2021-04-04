class DockingStation
  attr_reader :docking_bay

  def initialize
    @docking_bay = []
  end

  def release_bike
    dockingbay.pop
  end

  def dock_bike(bike)
    dockingbay.push(bike)
  end

  def has_bikes?
    !dockingbay.empty?
  end

  private
  
  def dockingbay
    @docking_bay
  end

end
