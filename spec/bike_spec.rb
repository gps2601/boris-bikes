require 'bike'

describe Bike do
  it 'responds to working?' do
    my_bike = Bike.new

    expect(my_bike).to respond_to(:working?)
  end

  it 'responds to broken' do
    my_bike = Bike.new

    expect(my_bike).to respond_to(:is_broken)
  end

  it 'says bike is not working if bike is broken' do
    my_bike = Bike.new

    my_bike.is_broken

    expect(my_bike.working?).to be false
  end
end
