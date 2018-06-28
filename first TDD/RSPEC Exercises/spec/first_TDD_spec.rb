require 'rspec'
require 'first_TDD'

RSpec.describe Array do
  subject(:arr) { Array.new([1,2,-2,1,3,0,-1,3]) }

  describe '#my_uniq' do
    # before (:each) do
    it 'removes all duplicates from self' do
      # arr = [1,2,1,3,3]
      expect(arr.my_uniq).to eq([1,2,-2,3,0,-1])
    end

    it 'raises an argument error when an argument is provided' do
      # arr = [1,2,1,3,3]
      expect { arr.my_uniq([1,1]) }.to raise_error(ArgumentError)
    end
  end

  describe '#two_sum' do

    it 'raises an argument error when an argument is provided' do
      expect { arr.two_sum([1,1]) }.to raise_error(ArgumentError)
    end

    it 'returns an array of pairs of indices which sum to zero' do
      expect(arr.two_sum).to eq([[0,6], [1,2], [3,6]])
    end
  end

  describe '#my_transpose' do
    arr2 = Array.new([[0, 1, 2],[3, 4, 5],[6, 7, 8]])
    it 'returns all elements of the original array' do


      expect(arr2.my_transpose.flatten.sort).to eq(arr2.flatten.sort)
    end

    it 'returns the transposed matrix' do
      expect(arr2.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
  end

  describe '#stock_picker' do
    arr3 = Array.new([6,5,2,8,10,1])
    it 'returns an array' do
      expect(arr3.stock_picker.class).to be(Array)
    end

    it 'returns the sell day greater than the buy day' do
      expect(arr3.stock_picker[1] > arr3.stock_picker[0]).to be true
    end

    it 'returns the pair of days that has the greatest profit' do
      expect(arr3.stock_picker).to eq([2,4])
    end
  end

end
