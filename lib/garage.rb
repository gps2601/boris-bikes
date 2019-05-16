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
    @bikes.select {|bike| bike.working?}
  end

  def store_bike(bike)
    @bikes.push(bike)
  end
end
