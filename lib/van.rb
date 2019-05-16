class Van
  attr_reader :bikes
  def initialize
    @bikes = []
  end
#guard case / type check
  def collect_faulty_bikes_from(bike_receptacle)
    @bikes.concat(bike_receptacle.give_faulty_bikes)
  end

  def deliver_faulty_bikes_to(bike_receptacle)
    faulty_bikes = @bikes.select{|bike| !bike.working?}
    @bikes = @bikes - faulty_bikes
    bike_receptacle.receive_faulty_bikes(faulty_bikes)
  end

  def collect_working_bikes_from(bike_receptacle)
  end

  def store_bike(bike)
    @bikes.push(bike)
  end
end
