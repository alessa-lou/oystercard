require 'station'

describe Station do
  it "knows its name" do
    station = Station.new
    expect(station.name).to eq(station.random_station[:station_name])
  end

  it "knows its zone" do
    station = Station.new
    expect(station.zone).to eq(station.random_station[:station_zone])
  end

end
