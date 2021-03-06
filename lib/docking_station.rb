require_relative('bike')

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :docked_bikes, :capacity

  def initialize(number_of_bikes = DEFAULT_CAPACITY)
    @capacity = number_of_bikes
    @docked_bikes = []
  end

  def release_bike
    index_of_first_working_bike = docked_bikes.index(&:working?)
    raise 'No bikes available' if index_of_first_working_bike.nil?

    docked_bikes.delete_at(index_of_first_working_bike)
  end

  def dock(bike)
    raise 'Docking station at capacity' if full?

    docked_bikes.push(bike)
  end

  def give_faulty_bikes
    bikes_to_return = docked_bikes.reject(&:working?)
    self.docked_bikes = docked_bikes - bikes_to_return
    bikes_to_return
  end

  def receive_working_bikes(working_bikes)
    raise 'We do not accept faulty bikes here' if working_bikes.any? { |bike| !bike.working? }

    resulting_size = docked_bikes.count + working_bikes.count
    raise 'Docking station at capacity' if resulting_size > capacity

    docked_bikes.concat(working_bikes)
  end

  private

  def full?
    docked_bikes.count >= capacity
  end

  def empty?
    docked_bikes.count <= 0
  end
end
