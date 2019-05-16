class Van
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def collect_faulty_bikes_from(bike_receptacle)
    @bikes.concat(bike_receptacle.give_faulty_bikes)
  end

  def deliver_faulty_bikes_to(bike_receptacle)
    faulty_bikes = @bikes.select{|bike| !bike.working?}
    @bikes = @bikes - faulty_bikes
    bike_receptacle.receive_faulty_bikes(faulty_bikes)
  end

  def collect_working_bikes_from(bike_receptacle)
    working_bikes_received = bike_receptacle.give_working_bikes
    @bikes.concat(working_bikes_received)
  end

  def deliver_working_bikes_to(bike_receptacle)
    working_bikes = @bikes.select{|bike| bike.working?}
    @bikes = @bikes - working_bikes
    bike_receptacle.receive_working_bikes(working_bikes)
  end

  def store_bike(bike)
    @bikes.push(bike)
  end
end
