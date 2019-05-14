require 'bike'

describe Bike do
  it 'responds to working?' do
    my_bike = Bike.new

    expect(my_bike).to respond_to(:working?)
  end
end
