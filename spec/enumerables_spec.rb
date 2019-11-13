require_relative '../enumerables.rb'
describe Enumerable do
  
describe 'my_select' do
  it 'select all the items in the array with data type Numeric' do
    expect([1, 9].my_select { |i| i.is_a? Numeric }).to eq([1, 9])
    end
  it 'if item inside the array doesn´t pass the rule of the block, retrun empty array' do
    expect([1, 9].my_select { |i| i == 10 }).to eq([])
    end  
  end
  describe "my_none?" do
    it "if all elements in the array are equal to false when the block condition is applied in the items return true" do
      expect([1,2,3,4].my_none?{|x| x == 20}).to be true
  end
  it "if all elements in the array are equal to false when the block condition is applied in the items return true" do
    expect([1,2,3,4].my_none?{|x| x == 20}).to be true
end
  it "the parameter is a regexp and if match one item of the array return true" do 
    expect([1,2,3,4].my_none?{|x| x == "/n"}).to be true
  end
end

describe "my_any?" do
  it "if element match return true" do
    expect([1,2,3,4].my_any?{|x| x == x}).to be true
end
  it "if element doesn't match return false" do
    expect([1,2,3,4].my_any?{|x| x != x}).to be false
end
end
it "if doesnt pass any block or parameter return false if none of the elements are equal to true" do
  expect([false, nil].my_any?).to be false  
end
end


#it "if doesnt pass any block or parameter return false if none of the elements are equal to true"
