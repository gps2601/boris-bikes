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
end
