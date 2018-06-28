require 'towers'
require 'rspec'

RSpec.describe Towers do
subject (:towers) {Towers.new()}

  describe '#initialize' do
    context 'when a new game is started' do
      it 'starts the game with 3 towers' do
        expect(towers.piles.length).to eq(3)
      end

      it 'starts the game with 3 discs at the first tower' do
        expect(towers.piles[0].length).to eq(3)
      end

      it 'starts the game with 0 discs at the second and third tower' do
        expect(towers.piles[1].concat(towers.piles[2])).to be_empty
      end
    end
  end

  describe '#move' do
    it 'raises an argument error when a tower doesnt exist' do
      expect { towers.move(4, 2) }.to raise_error(ArgumentError)
    end

    it 'raises an error when a disc is selected from an empty tower' do
      expect { towers.move(1, 2) }.to raise_error(StandardError)
    end
    it 'raises an error when the selected disc is placed on a smaller disc' do
      popped = towers.piles[0].pop
      towers.piles[1].push(popped)

      expect { towers.move(0, 1) }.to raise_error(StandardError)
    end
    it 'raises an error when the disc is moved to its same tower' do
      expect { towers.move(0, 0) }.to raise_error(StandardError)
    end
    it 'performs the move' do
      towers.move(0,1)
      expect(towers.piles).to eq([[3,2],[1],[]])
    end
  end

  describe '#won?' do
    it 'returns a boolean indicating whether the game is over or not' do
      expect(towers.won?).to be([true, false])
    end
    it 'checks the first tower AND either one of the other two towers are empty'
  end

end
