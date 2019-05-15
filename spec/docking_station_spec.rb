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
    my_bike = Bike.new
    my_docking_station.dock(my_bike)

    my_bike = my_docking_station.release_bike

    expect(my_bike).to be_instance_of(Bike)
  end

  it 'gets a bike that is working' do
    my_docking_station = DockingStation.new
    my_bike = Bike.new
    my_docking_station.dock(my_bike)
    my_bike = my_docking_station.release_bike

    expect(my_bike.working?).to eq(true)
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
    my_bike = Bike.new

    expect(my_docking_station.dock(my_bike)).to eq([my_bike])
  end

  it 'returns a docked bike' do
    my_docking_station = DockingStation.new
    bike = Bike.new

    my_docking_station.dock(bike)

    expect(my_docking_station.release_bike).to eq(bike)
  end

  it 'raises error if no bike docked' do
    my_docking_station = DockingStation.new

    expect { my_docking_station.release_bike }.to raise_error 'No bikes available'
  end

  it 'raises error if docking station is at capacity' do
    my_docking_station = DockingStation.new
    my_docking_station.dock(Bike.new)
    expect { my_docking_station.dock Bike.new }.to_not raise_error
  end

  it 'raises error if docking station has more than 20 bikes in' do
    my_docking_station = DockingStation.new
    default_capacity.times do
      my_docking_station.dock(Bike.new)
    end
    expect { my_docking_station.dock Bike.new }.to raise_error 'Docking station at capacity'
  end

  it 'can set a default value for number of bikes' do
    my_docking_station = DockingStation.new

    expect(my_docking_station.capacity).to eq(default_capacity)
  end

  it 'can accept an argument for setting number of bikes' do
    my_docking_station = DockingStation.new(100)

    expect(my_docking_station.capacity).to eq(100)
  end
end
