class Van
  attr_reader :bikes
  def collect_bikes_from(bike_receptacle)
    @bikes = bike_receptacle.give_faulty_bikes
  end
end
