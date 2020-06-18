
class Station
  attr_reader :name, :zone, :random_station

  def initialize

    @random_station = underground_stations.sample
    @name = random_station[:station_name]
    @zone = random_station[:station_zone]

    underground_stations = [
      {:station_name => "Waterloo", :station_zone => 1},
      {:station_name => "Oxford Circus", :station_zone => 1},
      {:station_name => "Elephant&Castle", :station_zone => 2},
      {:station_name => "Hampstead", :station_zone => 3},
      {:station_name => "Brixton", :station_zone => 2},
      
      ]
  end

end
