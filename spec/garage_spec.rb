require 'garage'

describe Garage do
  it 'can respond to receiving bikes' do
    my_garage = Garage.new

    expect(my_garage).to respond_to(:receive_faulty_bikes).with(1).argument
  end
end
