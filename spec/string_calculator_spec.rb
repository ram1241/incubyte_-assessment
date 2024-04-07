require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  let(:calculator) { StringCalculator.new }

  describe '#add_method' do
    context 'when no inputs are provided' do
      it 'returns a message to enter inputs' do
        expect(calculator.add()).to eq('please enter inputs')
      end
    end

    context 'when inputs are provided' do
      it 'returns the sum of the numbers in the string' do
        expect(calculator.add("1,2,3")).to eq(6)
      end

      it 'handles new line as a delimiter' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end

      it 'raises an error when negative numbers are provided' do
        expect { calculator.add("-2","-3") }.to raise_error(RuntimeError, 'negative numbers not allowed: -2, -3')
      end

      it 'allows custom delimiters' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end
  end
end
