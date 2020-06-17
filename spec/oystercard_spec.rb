require 'oystercard'

describe Oystercard do
  
  let(:oystercard) { Oystercard.new }
  
    describe 'initialize' do
        it 'can create an instance of oystercard' do
            #oystercard = Oystercard.new
            expect(oystercard).to be_an_instance_of(Oystercard)
        end
    end

    
    describe '#balance' do
      it 'checks balance' do
        #oystercard = Oystercard.new
        expect(oystercard.balance).to eq(0)
      end
    end
    
     describe '#top_up' do
     # it { is_expected.to respond_to(:top_up).with(1).argument }
      #it 'can top up the balance' do
      #expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      #end
      it 'adds money to the balance' do
        #oystercard = Oystercard.new
        oystercard.top_up(3)
        expect { oystercard.top_up(3) }.to change { oystercard.balance }.by(3)
      end
      it 'raises an error if the balance exceeds 90' do
        #oystercard = Oystercard.new
        #max_balance = Oystercard::MAX_BALANCE
        oystercard.top_up(Oystercard::MAX_BALANCE)
        expect { oystercard.top_up(1) }.to raise_error 'exceeded balance'
      end
    end
    
    xdescribe '#deduct' do
      it 'deducts the fare from the balance' do
        #oystercard = Oystercard.new
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
      it 'in_journey will be true when touched in' do
        #oystercard = Oystercard.new
        oystercard.top_up(10)
        oystercard.touch_in
        #expect(oystercard.in_journey).to eq(true)
        expect(oystercard).to be_in_journey
      end
      it 'if low balance cant touch in' do
        #oystercard = Oystercard.new
        #min_balance = Oystercard::MIN_BALANCE
        #ystercard.touch_in
        #@balance = 0
        #oystercard.deduct(10)
        expect{ oystercard.touch_in }.to raise_error 'low balance'
      end
    end
    
    describe '#touch_out' do
      it 'in_journey will be false when touched out' do
        #oystercard = Oystercard.new
        oystercard.top_up(10)
        oystercard.touch_in
        oystercard.touch_out
        #expect(oystercard.in_journey).to eq(false)
        expect(subject).not_to be_in_journey
      end
      
      it 'deducts minimum balance from balance' do
        subject.top_up(10)
        subject.touch_in
        #min_balance = Oystercard::MIN_BALANCE
        expect{ subject.touch_out }.to change { subject.balance }.by(-1)
      end
        
      
    end
    
    
end