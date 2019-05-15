require 'garage'

describe Garage do
  it 'can respond to receiving bikes' do
    my_garage = Garage.new

    expect(my_garage).to respond_to(:receive_faulty_bikes).with(1).argument
  end

  it 'can store the faulty bikes it receives' do
    my_garage = Garage.new
    first_faulty_bike = double(:bike, working?: false)
    second_faulty_bike = double(:bike, working?: false)
    my_garage.receive_faulty_bikes([first_faulty_bike, second_faulty_bike])

    expect(my_garage.bikes).to eq([first_faulty_bike, second_faulty_bike])
  end
end
