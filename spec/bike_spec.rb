require 'bike'

describe Bike do
  let!(:bike) do
    @my_bike = Bike.new
  end

  it 'responds to working?' do
    expect(@my_bike).to respond_to(:working?)
  end

  it 'responds to broken' do
    expect(@my_bike).to respond_to(:is_broken)
  end

  it 'says bike is not working if bike is broken' do
    @my_bike.is_broken

    expect(@my_bike.working?).to be false
  end

  it 'can be fixed' do
    @my_bike.is_broken
    @my_bike.fix

    expect(@my_bike.working?).to be true
  end
end
