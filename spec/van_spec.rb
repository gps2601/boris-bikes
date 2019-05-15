require 'van'

describe Van do
  it 'can respond to collect bikes from' do
    my_van = Van.new

    expect(my_van).to respond_to(:collect_bikes_from).with(1).argument
  end

  it 'will store the result of telling bike receptacle to give bikes' do
    my_van = Van.new
    bike_receptacle = double(:bike_receptacle, give_faulty_bikes: ["faulty bike"])

    my_van.collect_bikes_from(bike_receptacle)

    expect(my_van.bikes).to eq(["faulty bike"])
  end

  it 'can store multiple bikes receieved from bike receptacle' do
    my_van = Van.new
    bike_receptacle = double(:bike_receptacle, give_faulty_bikes: ["faulty bike 1", "faulty bike 2"])

    my_van.collect_bikes_from(bike_receptacle)

    expect(my_van.bikes).to eq(["faulty bike 1", "faulty bike 2"])
  end
end
