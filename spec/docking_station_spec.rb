require 'docking_station'
require 'bike'

describe DockingStation do
  default_capacity = DockingStation::DEFAULT_CAPACITY
  it { is_expected.to respond_to(:release_bike) }

  it 'will respond to release_bike' do
    my_docking_station = DockingStation.new

    expect(my_docking_station).to respond_to(:release_bike)
  end

  it 'gets a bike' do
    my_docking_station = DockingStation.new
    my_bike = double(:bike, working?: true)
    my_docking_station.dock(my_bike)

    expect{ my_docking_station.release_bike }.to_not raise_error
  end

  it 'will respond to dock with an argument' do
    my_docking_station = DockingStation.new

    expect(my_docking_station).to respond_to(:dock).with(1).argument
  end

  it 'will respond to bike' do
    my_docking_station = DockingStation.new

    expect(my_docking_station).to respond_to(:docked_bikes)
  end

  it 'docks the bike we dock' do
    my_docking_station = DockingStation.new
    my_bike = double(:bike, working?: true)

    expect(my_docking_station.dock(my_bike)).to eq([my_bike])
  end

  it 'returns a docked bike' do
    my_docking_station = DockingStation.new
    bike = double(:bike, working?: true)

    my_docking_station.dock(bike)

    expect(my_docking_station.release_bike).to eq(bike)
  end

  it 'raises error if no bike docked' do
    my_docking_station = DockingStation.new

    expect { my_docking_station.release_bike }.to raise_error 'No bikes available'
  end

  it 'raises error if docking station is at capacity' do
    my_docking_station = DockingStation.new
    my_bike = double(:bike)
    my_docking_station.dock(Bike.new)
    expect { my_docking_station.dock Bike.new }.to_not raise_error
  end

  it 'raises error if docking station has more than 20 bikes in' do
    my_docking_station = DockingStation.new
    default_capacity.times do
      my_docking_station.dock(double(:bike))
    end

    my_bike = double(:bike, working?: true)

    expect { my_docking_station.dock my_bike }.to raise_error 'Docking station at capacity'
  end

  it 'can set a default value for number of bikes' do
    my_docking_station = DockingStation.new

    expect(my_docking_station.capacity).to eq(default_capacity)
  end

  it 'can accept an argument for setting number of bikes' do
    my_docking_station = DockingStation.new(100)

    expect(my_docking_station.capacity).to eq(100)
  end

  it 'uses the provided amount of bikes to check if it is full or not' do
    my_docking_station = DockingStation.new(100)
    (default_capacity).times do
      my_docking_station.dock(double(:bike))
    end

    my_bike = double(:bike)

    expect { my_docking_station.dock(my_bike) }.to_not raise_error
  end

  it 'will not release a bike that is not working' do
    my_docking_station = DockingStation.new
    my_broken_bike = double(:bike, working?: false)
    my_docking_station.dock(my_broken_bike)

    expect{ my_docking_station.release_bike }.to raise_error 'No bikes available'
  end

  it 'will release a bike that is working' do
    my_docking_station = DockingStation.new
    my_broken_bike = double(:bike, working?: false)
    my_working_bike = double(:bike, working?: true)
    my_docking_station.dock(my_broken_bike)
    my_docking_station.dock(my_working_bike)

    expect(my_docking_station.release_bike).to eq(my_working_bike)
  end

  it 'can respond to give_faulty_bikes' do
    my_docking_station = DockingStation.new
    expect(my_docking_station).to respond_to(:give_faulty_bikes)
  end

  it 'can give you all the faulty bikes' do
    my_docking_station = DockingStation.new
    first_broken_bike = double(:bike, working?: false)
    second_broken_bike = double(:bike, working?: false)
    third_broken_bike = double(:bike, working?: false)
    my_docking_station.dock(first_broken_bike)
    my_docking_station.dock(second_broken_bike)
    my_docking_station.dock(third_broken_bike)

    faulty_bikes = my_docking_station.give_faulty_bikes
    expect(faulty_bikes).to eq([first_broken_bike, second_broken_bike, third_broken_bike])
  end

  it 'will only remove the faulty bikes the docking station' do
    my_docking_station = DockingStation.new
    first_broken_bike = double(:bike, working?: false)
    second_broken_bike = double(:bike, working?: false)
    third_broken_bike = double(:bike, working?: false)
    working_bike = double(:bike, working?: true)
    my_docking_station.dock(first_broken_bike)
    my_docking_station.dock(second_broken_bike)
    my_docking_station.dock(third_broken_bike)
    my_docking_station.dock(working_bike)

    faulty_bikes = my_docking_station.give_faulty_bikes
    bikes_left_in_docking_station = my_docking_station.docked_bikes
    all_bikes_working = bikes_left_in_docking_station.all? {|bike| bike.working?}

    expect(all_bikes_working).to be true
  end

  it 'can respond to receiving working bikes' do
    my_docking_station = DockingStation.new

    expect(my_docking_station).to respond_to(:receive_working_bikes).with(1).argument
  end

  it 'will store working bikes received' do
    my_docking_station = DockingStation.new
    working_bike = double(:bike, working?: true)
    working_bikes = [working_bike]

    my_docking_station.receive_working_bikes(working_bikes)

    expect(my_docking_station.docked_bikes).to eq(working_bikes)
  end

  it 'will not accept bikes if any are faulty' do
    my_docking_station = DockingStation.new
    faulty_bike = double(:bike, working?: false)
    working_bike = double(:bike, working?: true)
    bikes = [working_bike, faulty_bike]

    expect { my_docking_station.receive_working_bikes(bikes) }.to raise_error "We do not accept faulty bikes here"
  end
end
