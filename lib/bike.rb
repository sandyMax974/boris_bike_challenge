class Bike
attr_accessor :broken_status
  def initialize(status = false)
    @broken_status = status
  end

  def working?
    !@broken_status
  end

  def broken(status = true)
    @broken_status = status
  end

  def fixing(status = false)
    @broken_status = status
  end

end 