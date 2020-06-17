require 'oystercard'

describe Oystercard do
  
  let(:oystercard) { Oystercard.new }
  let(:station) { double("station") }
  
    describe 'initialize' do
        it 'can create an instance of oystercard' do
            #oystercard = Oystercard.new
            expect(subject).to be_an_instance_of(Oystercard)
        end

        it 'has an empty list of journeys by default' do
          expect(subject.journeys).to be_empty
        end
    end

    
    describe '#balance' do
      it 'checks balance' do
        #oystercard = Oystercard.new
        expect(subject.balance).to eq(0)
      end
    end
    
     describe '#top_up' do
     # it { is_expected.to respond_to(:top_up).with(1).argument }
      #it 'can top up the balance' do
      #expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      #end
      it 'adds money to the balance' do
        #oystercard = Oystercard.new
        subject.top_up(3)
        expect { subject.top_up(3) }.to change { subject.balance }.by(3)
      end
      it 'raises an error if the balance exceeds 90' do
        #oystercard = Oystercard.new
        #max_balance = Oystercard::MAX_BALANCE
        subject.top_up(Oystercard::MAX_BALANCE)
        expect { subject.top_up(1) }.to raise_error 'exceeded balance'
      end
    end
    
    xdescribe '#deduct' do
      it 'deducts the fare from the balance' do
        #oystercard = Oystercard.new
        subject.deduct(3)
        expect{ subject.deduct(2) }.to change { subject.balance }.by(-2)
      end
    end
    
    describe 'in_journey' do
      it 'is initially not in a journey' do
        expect(subject).not_to be_in_journey
      end
    end
    
        
    describe '#touch_in' do
      
       it 'if low balance cant touch in' do
        #oystercard = Oystercard.new
        #min_balance = Oystercard::MIN_BALANCE
        #ystercard.touch_in
        #@balance = 0
        #oystercard.deduct(10)
        expect{ subject.touch_in(station) }.to raise_error 'low balance'
      end
      
      before(:each) do
        oystercard = Oystercard.new
        oystercard.top_up(10)
        oystercard.touch_in(station)
      end


      it 'in_journey will be true when touched in' do
        expect(oystercard).to be_in_journey
      end
      
      it 'remembers the entry station for the journey' do
        # subject.top_up(10)
         #subject.touch_in(station)
        expect(oystercard.entry_station).to eq station
      end

    end
    
    describe '#touch_out' do
      xit 'in_journey will be false when touched out' do
        #oystercard = Oystercard.new
        # oystercard.top_up(10)
         #oystercard.touch_in(station)
        subject.touch_out(station)
        #expect(oystercard.in_journey).to eq(false)
        expect(subject).not_to be_in_journey
      end
      
      xit 'deducts minimum balance from balance' do
        # subject.top_up(10)
         #subject.touch_in(station)
        #min_balance = Oystercard::MIN_BALANCE
        expect{ subject.touch_out(station) }.to change { subject.balance }.by(-1)
      end
        
      it 'sets entry station to nil' do
        # subject.top_up(10)
         #subject.touch_in(station)
        #subject.touch_out(station)
        expect(subject.entry_station).to be_nil
      end
      
      it { is_expected.to respond_to(:touch_out).with(1).argument }
      
      xit 'remembers the last station' do
        # subject.top_up(10)
         #subject.touch_in(station)
        expect(subject.touch_out(station)).to eq(station)
      end
    end
    
    describe 'journeys' do
    
      xit 'has entry_station as a key' do
        subject.top_up(10)
        subject.touch_in(station)
        expect(subject.journeys).to have_key(:entry_station)
      end
      
      xit 'has exit_station as a key' do
        subject.top_up(10)
        subject.touch_in(station)
        subject.touch_out(station)
        expect(subject.journeys).to have_key(:exit_station)
      end
      
      xit 'stores the entry and exit stations' do
        subject.top_up(10)
        subject.touch_in(station)
        subject.touch_out(station)
        expect(subject.journeys).to eq({entry_station: station, exit_station: station})
      end

      it 'returns a whole journey in 1 location' do
        subject.top_up(10)
        subject.touch_in(station)
        subject.touch_out(station)
        expect(subject.journeys).to eq([{entry_station: station, exit_station: station}])
      end
    end
    


    
end