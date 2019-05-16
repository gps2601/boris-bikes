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

  it 'can give all the working bikes it has' do
    my_garage = Garage.new

    first_working_bike = double(:bike, working?: true)
    second_working_bike = double(:bike, working?: true)
    third_working_bike = double(:bike, working?: true)
    broken_bike = double(:bike, working?: false)
    my_garage.store_bike(first_working_bike)
    my_garage.store_bike(second_working_bike)
    my_garage.store_bike(third_working_bike)
    my_garage.store_bike(broken_bike)

    bikes_receieved = my_garage.give_working_bikes

    expect(bikes_receieved).to eq([first_working_bike, second_working_bike, third_working_bike])
  end

  it 'can removes the working bike it has' do
    my_garage = Garage.new

    first_working_bike = double(:bike, working?: true)
    second_working_bike = double(:bike, working?: true)
    third_working_bike = double(:bike, working?: true)
    broken_bike = double(:bike, working?: false)
    my_garage.store_bike(first_working_bike)
    my_garage.store_bike(second_working_bike)
    my_garage.store_bike(third_working_bike)
    my_garage.store_bike(broken_bike)

    bikes_receieved = my_garage.give_working_bikes

    expect(my_garage.bikes).to eq([broken_bike])
  end
end
