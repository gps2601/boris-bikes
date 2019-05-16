require 'garage'

describe Garage do
  let!(:my_garage) do
    @my_garage = Garage.new
  end

  it 'can respond to receiving bikes' do
    expect(@my_garage).to respond_to(:receive_faulty_bikes).with(1).argument
  end

  it 'can store the faulty bikes it receives' do
    faulty_bike = double(working?: false, fix: true)
    @my_garage.receive_faulty_bikes([faulty_bike, faulty_bike])

    expect(@my_garage.bikes).to eq([faulty_bike, faulty_bike])
  end

  it 'attempts to fix the faulty bikes it receives' do
    faulty_bike = double(working?: false, fix: true)
    expect(faulty_bike).to receive(:fix)

    @my_garage.receive_faulty_bikes([faulty_bike])
  end

  it 'can respond to give working bikes' do
    expect(@my_garage).to respond_to(:give_working_bikes)
  end

  it 'can give all the working bikes it has' do
    first_working_bike = double(:bike, working?: true)
    second_working_bike = double(:bike, working?: true)
    third_working_bike = double(:bike, working?: true)
    broken_bike = double(:bike, working?: false)
    @my_garage.store_bike(first_working_bike)
    @my_garage.store_bike(second_working_bike)
    @my_garage.store_bike(third_working_bike)
    @my_garage.store_bike(broken_bike)

    bikes_receieved = @my_garage.give_working_bikes

    expect(bikes_receieved)
      .to eq([first_working_bike, second_working_bike, third_working_bike])
  end

  it 'can removes the working bike it has' do
    first_working_bike = double(:bike, working?: true)
    second_working_bike = double(:bike, working?: true)
    third_working_bike = double(:bike, working?: true)
    broken_bike = double(:bike, working?: false)
    @my_garage.store_bike(first_working_bike)
    @my_garage.store_bike(second_working_bike)
    @my_garage.store_bike(third_working_bike)
    @my_garage.store_bike(broken_bike)

    @my_garage.give_working_bikes

    expect(@my_garage.bikes).to eq([broken_bike])
  end
end
