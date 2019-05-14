require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'will respond to release_bike' do
    my_docking_station = DockingStation.new

    expect(my_docking_station).to respond_to(:release_bike)
  end

  it 'gets a bike' do
    my_docking_station = DockingStation.new

    my_bike = my_docking_station.release_bike

    expect(my_bike).to be_instance_of(Bike)
  end

  it 'gets a bike that is working' do
    my_docking_station = DockingStation.new

    my_bike = my_docking_station.release_bike

    expect(my_bike.working?).to eq(true)
  end
end
