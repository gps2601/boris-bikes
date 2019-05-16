class Garage
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def receive_faulty_bikes(faulty_bikes)
    faulty_bikes.each do |bike|
      bike.fix
      @bikes.push(bike)
    end
  end

  def give_working_bikes
    bikes_to_return = @bikes.select{|bike| bike.working?}
    @bikes = @bikes - bikes_to_return
    bikes_to_return
  end

  def store_bike(bike)
    @bikes.push(bike)
  end
end
