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
      it { is_expected.to respond_to(:top_up).with(1).argument }
      it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      end
    end
end