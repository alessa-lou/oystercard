#Let's create a new Journey class, it should be responsible for starting a journey, finishing a journey, 
#calculating the fare of a journey, and returning whether or not the journey is complete.

class Journey
    attr_reader :journeys
    
    def initialize
      @journeys = []
    end
    
    def touch_in(station)
      @entry_station = station
    end
    
    def touch_out(station)
     @journeys << {entry_station: @entry_station, exit_station: station }
      @entry_station = nil
    end
    
    def deduct(fare)
      @balance -= fare
    end
    
    def in_journey?
      true if @entry_station
    end
    
end