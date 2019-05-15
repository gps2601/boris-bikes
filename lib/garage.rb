class Garage
  attr_reader :bikes
  def initialize
    @bikes = []
  end
  def receive_faulty_bikes(faulty_bikes)
    bikes.concat(faulty_bikes)
  end
end
