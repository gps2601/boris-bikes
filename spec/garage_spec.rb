require 'garage'
require 'bike'

describe Garage do
  it 'can respond to receiving bikes' do
    my_garage = Garage.new

    expect(my_garage).to respond_to(:receive_faulty_bikes).with(1).argument
  end

  it 'can store the faulty bikes it receives' do
    my_garage = Garage.new
    first_faulty_bike = Bike.new
    first_faulty_bike.is_broken
    second_faulty_bike = Bike.new
    second_faulty_bike.is_broken
    my_garage.receive_faulty_bikes([first_faulty_bike, second_faulty_bike])

    expect(my_garage.bikes).to eq([first_faulty_bike, second_faulty_bike])
  end

  it 'can fixes the faulty bikes it receives' do
    my_garage = Garage.new
    first_faulty_bike = Bike.new
    first_faulty_bike.is_broken
    my_garage.receive_faulty_bikes([first_faulty_bike])

    expect(my_garage.bikes[0].working?).to be true
  end

  it 'can respond to give working bikes' do
    my_garage = Garage.new

    expect(my_garage).to respond_to(:give_working_bikes)
  end
end
