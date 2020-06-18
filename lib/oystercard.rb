#require_relative 'station'
require_relative 'journey'

class Oystercard
    attr_reader :balance, :entry_station, :journeys
    MAX_BALANCE = 90
    MIN_BALANCE = 1

    def initialize
        @balance = 0
        # @journeys = []
    end

    def top_up(amount)
      fail 'exceeded balance' if (@balance + amount) > MAX_BALANCE
      @balance += amount
    end

    # private
    # def deduct(fare)
    #   @balance -= fare
    # end

    #public

    def touch_in(station)
  #    station = Station.new
      fail 'low balance' if @balance <= MIN_BALANCE
      # @entry_station = station
    end

    def touch_out(station)
  #    station = Station.new
      deduct(1)
      # @journeys << {entry_station: @entry_station, exit_station: station }
      # @entry_station = nil
    end


end
