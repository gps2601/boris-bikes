class Van
  attr_reader :bikes
  def initialize
    @bikes = []
  end
#guard case / type check  
  def collect_bikes_from(bike_receptacle)
    @bikes.concat(bike_receptacle.give_faulty_bikes)
  end
end
