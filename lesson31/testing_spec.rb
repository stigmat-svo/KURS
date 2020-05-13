require 'rspec'
require_relative 'testing.rb'

describe "Testing" do

  it "should do something" do
    expect( Testing.inclination(5, 'олень', 'оленя', 'оленей')).to eq 'оленей'
  end
end
