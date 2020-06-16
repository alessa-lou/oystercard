require 'oystercard'

describe Oystercard do
    describe 'initialize' do
        it 'can create an instance of oystercard' do
            oystercard = Oystercard.new
            expect(oystercard).to be_an_instance_of(Oystercard)
        end
    end

    
    describe '#balance' do
      it 'checks balance' do
        oystercard = Oystercard.new
        expect(oystercard.balance).to eq(0)
      end
    end
    
     describe '#top_up' do
     # it { is_expected.to respond_to(:top_up).with(1).argument }
      #it 'can top up the balance' do
      #expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      #end
      it 'adds money to the balance' do
        oystercard = Oystercard.new
        oystercard.top_up(3)
        expect { oystercard.top_up(3) }.to change { oystercard.balance }.by(3)
      end
      it 'raises an error if the balance exceeds 90' do
        oystercard = Oystercard.new
        max_balance = Oystercard::MAX_BALANCE
        oystercard.top_up(max_balance)
        expect { oystercard.top_up(1) }.to raise_error 'exceeded balance'
      end
    end
end