class Bike

  def initialize
    @broken = false
  end

  def working?
    !@broken
  end

  def broken
    @broken = true
  end

end 