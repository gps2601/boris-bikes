require 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise 'No bikes available' if empty?

    @docked_bikes.pop
  end

  def dock(bike)
    raise 'Docking station at capacity' if full?

    @docked_bikes.push(bike)
  end

  private

  def full?
    @docked_bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @docked_bikes.count <= 0
  end
end
