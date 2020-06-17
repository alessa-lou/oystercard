class Oystercard
    attr_reader :balance, :entry_station 
    MAX_BALANCE = 90
    MIN_BALANCE = 1
    
    def initialize
        @balance = 0
    end

    def top_up(amount)
      fail 'exceeded balance' if (@balance + amount) > MAX_BALANCE
      @balance += amount
    end
    
    private
    def deduct(fare)
      @balance -= fare
    end
    
    public
    
    def in_journey?
      true if @entry_station
    end
    
    def touch_in(station)
      fail 'low balance' if @balance <= MIN_BALANCE
      @entry_station = station
    end

    def touch_out
      deduct(1)
      @entry_station = nil
    end
    
end