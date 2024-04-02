require 'rspec'
require 'pry'

require_relative '../lib/string_calculator'

describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns the number itself for a single number" do
    expect(calculator.add("1")).to eq(1)
  end

  it "returns the sum of two numbers" do
    expect(calculator.add("1,5")).to eq(6)
  end

  it "supports new lines between numbers" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "throws an exception for invalid input '1,\n'" do
    expect { calculator.add("1,\n") }.to raise_error("Invalid input")
  end

  it "supports different delimiters" do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  it "throws an exception for negative numbers" do
    expect { calculator.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed -2,-4")
  end

  it "ignores numbers greater than 1000" do
    expect(calculator.add("2,1001")).to eq(2)
  end

   it "handles numbers up to 1000" do
    expect(calculator.add("2,1000")).to eq(1002)
  end

end
