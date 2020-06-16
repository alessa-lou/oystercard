class Oystercard
    attr_reader :balance, :in_journey
    MAX_BALANCE = 90
    MIN_BALANCE = 1
    
    def initialize
        @balance = 0
        @in_journey = false
    end

    def top_up(amount)
      fail 'exceeded balance' if (@balance + amount) > MAX_BALANCE
      @balance += amount
    end
    
    def deduct(fare)
      @balance -= fare
    end
    
    def in_journey?
    false
    end
    
    def touch_in
      fail 'low balance' if @balance <= MIN_BALANCE
      @in_journey = true
    end
    
    def touch_out
      @in_journey = false
    end
    
end