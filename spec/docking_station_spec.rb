require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'will respond to release_bike' do
    my_docking_station = DockingStation.new

    expect(my_docking_station).to respond_to(:release_bike)
  end
end
