require 'van'

describe Van do
  it 'can respond to collect bikes from' do
    my_van = Van.new

    expect(my_van).to respond_to(:collect_faulty_bikes_from).with(1).argument
  end

  it 'will store the result of telling bike receptacle to give bikes' do
    my_van = Van.new
    bike_receptacle = double(:bike_receptacle, give_faulty_bikes: ["faulty bike"])

    my_van.collect_faulty_bikes_from(bike_receptacle)

    expect(my_van.bikes).to eq(["faulty bike"])
  end

  it 'can store multiple bikes receieved from bike receptacle' do
    my_van = Van.new
    bike_receptacle = double(:bike_receptacle, give_faulty_bikes: ["faulty bike 1", "faulty bike 2"])

    my_van.collect_faulty_bikes_from(bike_receptacle)

    expect(my_van.bikes).to eq(["faulty bike 1", "faulty bike 2"])
  end

  it 'can respond to deliver faulty bikes to a bike receptacle' do
    my_van = Van.new
    expect(my_van).to respond_to(:deliver_faulty_bikes_to).with(1).argument
  end

  it 'can deliver a faulty bike' do
    my_van = Van.new
    faulty_bike = double(:bike, working?: false)
    my_van.store_bike(faulty_bike)

    bike_receptacle = double(:bike_receptacle)
    allow(bike_receptacle).to receive(:receive_faulty_bikes).with(anything())
    my_van.deliver_faulty_bikes_to(bike_receptacle)

    expect(my_van.bikes).to be_empty
  end

  it 'can deliver a faulty bike but wont deliver a working bike' do
    my_van = Van.new
    faulty_bike = double(:bike, working?: false)
    working_bike = double(:bike, working?: true)
    my_van.store_bike(faulty_bike)
    my_van.store_bike(working_bike)

    bike_receptacle = double(:bike_receptacle)
    allow(bike_receptacle).to receive(:receive_faulty_bikes).with(anything())
    my_van.deliver_faulty_bikes_to(bike_receptacle)

    expect(my_van.bikes).to eq([working_bike])
  end
end
