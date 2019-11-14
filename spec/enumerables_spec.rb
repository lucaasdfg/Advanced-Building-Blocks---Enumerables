# frozen_string_literal: true

require_relative '../enumerables.rb'
describe Enumerable do
  let(:array) {[1, 2, 3, 4, 5]}
  let(:falsy_array) {[1, 22, false, 0, 'oop']}

  describe 'my_select' do
    it 'select all the items in the array with data type Numeric' do
      expect([1, 9].my_select { |i| i.is_a? Numeric }).to eq([1, 9])
    end
    it 'if item inside the array doesn´t pass the rule of the block, retrun empty array' do
      expect([1, 9].my_select { |i| i == 10 }).to eq([])
    end
  end
  describe 'my_none?' do
    it 'if all elements in the array are equal to false when the block condition is applied in the items return true' do
      expect([1, 2, 3, 4].my_none? { |x| x == 20 }).to be true
    end
    it 'if all elements in the array are equal to false when the block condition is applied in the items return true' do
      expect([1, 2, 3, 4].my_none? { |x| x == 20 }).to be true
    end
    it 'the parameter is a regexp and if match one item of the array return true' do
      expect([1, 2, 3, 4].my_none? { |x| x == '/n' }).to be true
    end
  end

  describe 'my_any?' do
    it 'if element match return true' do
      expect([1, 2, 3, 4].my_any? { |x| x == 4 }).to be true
    end
    it "if element doesn't match return false" do
      expect([1, 2, 3, 4].my_any? { |x| x == 8 }).to be false
    end
  end
  it 'if doesnt pass any block or parameter return false if none of the elements are equal to true' do
    expect([false, nil].my_any?).to be false
  end

  describe '#my_each' do
    it 'return Enumerator if no block is given' do
      expect(array.my_each).to be_a(Enumerator)
    end

    it 'when block is provided, its is applied to every item of array' do
      result = []
      array.my_each { |x| result << x * 2 }
      expect(result).to eq([2, 4, 6, 8, 10])
    end
  end
  describe 'my_all?' do
    it 'should return false when no block is given and when object contains false or nil values' do
      expect(falsy_array.my_all?).to equal(false)
    end
    it 'return false if one item of object collection doesnt pass block condition' do
      expect([3, 4, 2, 10, 9].my_all?(&:even?)).to be false
    end
    it 'return true if all items met true condition' do
      expect([3, 6, 9, 12].my_all? { |x| x % 3 == 0 }).to be true
    end
  end

  describe 'my_count' do
    it 'returned class should be Integer' do
      expect(array.my_count).to be_a(Integer)
    end

    it 'should return size of object when no parameter or block is given' do
      expect([1, 1, 1].my_count).to eql(3)
    end

    it 'should return count of items thad pass condition in block' do
      expect([1, 1, 1, 2].my_count { |x| x != 2 }).to eql(3)
    end
  end
end
