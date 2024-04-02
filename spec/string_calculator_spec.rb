require 'rspec'
require 'pry'

require_relative '../lib/string_calculator'

describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end
end
