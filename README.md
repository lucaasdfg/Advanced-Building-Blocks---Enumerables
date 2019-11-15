# Advanced-Building-Blocks---Enumerables
Ruby solo project

## quick tips

yield and the #call method.

# Enumerable methods
This project contains a replica of the few methods under the Enumerable Module

# Implementation
We implemented our own version of the following methods
* each
* each_with_index
* all?
* any?
* none?
* count
* map
* inject


# Pre-requisites
1. Ruby installed version
2. Code Editor of your taste (VS Code recommended)
3. Rubocop Gem installed [gem install rubocop]
4. install rspec with rspec --init
5. require_relative '../enumerables.rb' on your rspec


# example
describe Enumerable do
    describe 'my_select' do
    it 'select all the items in the array with data type Numeric' do
      expect([1, 9].my_select { |i| i.is_a? Numeric }).to eq([1, 9])
    end
end
# How to contribute and partipate
Fork this repo and submit a PR for review and potential merge to main branch

# Engineer
[Lucassdfg](https://github.com/lucaasdfg)
