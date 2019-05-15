require 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :docked_bikes, :capacity

  def initialize(number_of_bikes = DEFAULT_CAPACITY)
    @capacity = number_of_bikes
    @docked_bikes = []
  end

  def release_bike
    raise 'No bikes available' if empty?

    docked_bikes.pop
  end

  def dock(bike)
    raise 'Docking station at capacity' if full?

    docked_bikes.push(bike)
  end

  private

  def full?
    docked_bikes.count >= capacity
  end

  def empty?
    docked_bikes.count <= 0
  end
end
