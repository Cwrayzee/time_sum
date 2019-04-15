require 'rspec'
require_relative '../time_sum'

describe 'Adding minutes to set time' do

  it 'should return the correct time' do
    expect(time_sum("9:00 AM", 15)).to eq("9:15 AM")
  end

  it 'should raise RuntimeError error if format is not a valid time period' do
    expect{time_sum("9:00 CM", 10)}.to raise_error(RuntimeError)
  end

  it 'should raise RuntimeError error if format is not a valid time' do
    expect{time_sum("0:00 AM", 10)}.to raise_error(RuntimeError)
  end

  it 'should raise NoMethodError if not a time format' do
    expect{time_sum("This should fail.", 10)}.to raise_error(NoMethodError)
  end

  it 'should subtract time if negative argument' do
    expect(time_sum("9:00 AM", -10)).to eq("8:50 AM")
  end
end
