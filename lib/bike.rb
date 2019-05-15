class Bike
  def initialize
    @working = true
  end
  def working?
    @working
  end

  def is_broken
    @working = false
  end
end
