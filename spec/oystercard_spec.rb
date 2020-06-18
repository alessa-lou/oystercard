require 'oystercard'

describe Oystercard do
  
  let(:oystercard) { Oystercard.new }
  let(:station) { double("station") }
  
    describe 'initialize' do
        it 'can create an instance of oystercard' do
            expect(subject).to be_an_instance_of(Oystercard)
        end

        it 'has an empty list of journeys by default' do
          expect(subject.journeys).to be_empty
        end
    end

    
    describe '#balance' do
      it 'checks balance' do
        expect(subject.balance).to eq(0)
      end
    end
    
     describe '#top_up' do
      it 'adds money to the balance' do
        subject.top_up(3)
        expect { subject.top_up(3) }.to change { subject.balance }.by(3)
      end
      it 'raises an error if the balance exceeds 90' do
        subject.top_up(Oystercard::MAX_BALANCE)
        expect { subject.top_up(1) }.to raise_error 'exceeded balance'
      end
    end
    
    xdescribe '#deduct' do
      it 'deducts the fare from the balance' do
        oystercard.deduct(3)
        expect{ oystercard.deduct(2) }.to change { oystercard.balance }.by(-2)
      end
    end
    
    describe 'in_journey' do
      it 'is initially not in a journey' do
        expect(subject).not_to be_in_journey
      end
    end
    
        
    describe '#touch_in' do
      
       it 'if low balance cant touch in' do
        expect{ subject.touch_in(station) }.to raise_error 'low balance'
      end
      
      context "needs to be topped up" do
      before do
        oystercard.top_up(10)
        oystercard.touch_in(station)
      end


      it 'in_journey will be true when touched in' do
        expect(oystercard).to be_in_journey
      end
      
      it 'remembers the entry station for the journey' do
        expect(oystercard.entry_station).to eq station
      end
    end

    end
    
    describe '#touch_out' do
      
      context "needs to be topped up" do
        
      before do
        oystercard.top_up(10)
        oystercard.touch_in(station)
      end
      
      it 'in_journey will be false when touched out' do
        oystercard.touch_out(station)
        expect(oystercard).not_to be_in_journey
      end
      
      it 'deducts minimum balance from balance' do
        expect{ oystercard.touch_out(station) }.to change { oystercard.balance }.by(-1)
      end
        
      it 'sets entry station to nil' do
        oystercard.touch_out(station)
        expect(oystercard.entry_station).to be_nil
      end
      
      it { is_expected.to respond_to(:touch_out).with(1).argument }
    end
    end
    
    describe 'journeys' do
      it 'is empty by default at the start' do
        expect(subject.journeys).to be_empty
      end
      
      context "needs to be topped up, touched in and touched out" do
        
      before do
        oystercard.top_up(10)
        oystercard.touch_in(station)
        oystercard.touch_out(station)
      end
      
      it 'stores the entry and exit stations' do
        expect(oystercard.journeys).to eq([{entry_station: station, exit_station: station}])
      end

      it 'returns a whole journey in 1 location' do
        expect(oystercard.journeys).to eq([{entry_station: station, exit_station: station}])
      end
    end
    end
    


    
end