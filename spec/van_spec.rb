require 'van'

describe Van do
  let!(:my_van) do
    @my_van = Van.new
  end

  it 'can respond to collect bikes from' do
    expect(@my_van).to respond_to(:collect_faulty_bikes_from).with(1).argument
  end

  it 'will store the result of telling bike receptacle to give bikes' do
    bike_receptacle = double(give_faulty_bikes: ['faulty bike'])

    @my_van.collect_faulty_bikes_from(bike_receptacle)

    expect(@my_van.bikes).to eq(['faulty bike'])
  end

  it 'can store multiple bikes receieved from bike receptacle' do
    faulty_bikes = ['faulty bike 1', 'faulty bike 2']
    bike_receptacle = double(give_faulty_bikes: faulty_bikes)

    @my_van.collect_faulty_bikes_from(bike_receptacle)

    expect(@my_van.bikes).to eq(['faulty bike 1', 'faulty bike 2'])
  end

  it 'can respond to deliver faulty bikes to a bike receptacle' do
    expect(@my_van).to respond_to(:deliver_faulty_bikes_to).with(1).argument
  end

  it 'can deliver a faulty bike' do
    faulty_bike = double(:bike, working?: false)
    @my_van.store_bike(faulty_bike)

    bike_receptacle = double(:bike_receptacle)
    allow(bike_receptacle).to receive(:receive_faulty_bikes).with(anything)
    @my_van.deliver_faulty_bikes_to(bike_receptacle)

    expect(@my_van.bikes).to be_empty
  end

  it 'can deliver a faulty bike but wont deliver a working bike' do
    faulty_bike = double(:bike, working?: false)
    working_bike = double(:bike, working?: true)
    @my_van.store_bike(faulty_bike)
    @my_van.store_bike(working_bike)

    bike_receptacle = double(:bike_receptacle)
    allow(bike_receptacle).to receive(:receive_faulty_bikes).with(anything)
    @my_van.deliver_faulty_bikes_to(bike_receptacle)

    expect(@my_van.bikes).to eq([working_bike])
  end

  it 'can collect working bikes from bike receptacle' do
    expect(my_van).to respond_to(:collect_working_bikes_from).with(1).argument
  end

  it 'can store collected working bikes from bike receptacle' do
    bike_receptacle = double(:bike_receptacle)
    working_bike = double('working_bike')
    allow(bike_receptacle)
      .to receive(:give_working_bikes).and_return([working_bike, working_bike])

    @my_van.collect_working_bikes_from(bike_receptacle)

    expect(@my_van.bikes).to eq([working_bike, working_bike])
  end

  it 'can respond to delivering working bikes to bike receptacle' do
    expect(@my_van).to respond_to(:deliver_working_bikes_to).with(1).argument
  end

  it 'will can deliver a working bike' do
    working_bike = double(:bike, working?: true)
    @my_van.store_bike(working_bike)

    bike_receptacle = double(:bike_receptacle)
    allow(bike_receptacle).to receive(:receive_working_bikes).with(anything)
    @my_van.deliver_working_bikes_to(bike_receptacle)

    expect(@my_van.bikes).to be_empty
  end

  it 'wont deliver faulty bikes' do
    working_bike = double(:bike, working?: true)
    faulty_bike = double(:bike, working?: false)
    @my_van.store_bike(working_bike)
    @my_van.store_bike(faulty_bike)

    bike_receptacle = double(:bike_receptacle)
    allow(bike_receptacle).to receive(:receive_working_bikes).with(anything)
    @my_van.deliver_working_bikes_to(bike_receptacle)

    expect(@my_van.bikes).to eq([faulty_bike])
  end
end
