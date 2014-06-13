require './string_calculator'

describe StringCalculator::Calculator do

  subject(:calc) { StringCalculator::Calculator.new }

  context 'Adding empty string' do
    specify { expect(calc.add("")).to eq(0) }
    specify { expect(calc.add("2")).to eq(2) }
  end

  context 'Adding two numbers in string' do
    specify { expect(calc.add("8,6")).to eq(14) }
  end

  context 'Adding unlimited amount of numbers' do
    specify { expect(calc.add('1,2,3,4,5')).to eq(15) }
  end

  context 'Handles newlines between numbers' do
    specify { expect(calc.add("1\n2,3")).to eq(6)  }
  end

  context 'Handles many kinds of delimiters' do
    specify { expect(calc.add("//@\n1@1@10")).to eq(12) }

    it 'should allow linebreak as a delimeter' do
      calc.add("//\n
               1
               1
               10").should eq(12)
    end
  end

  context 'Calling with negative numbers' do
    it 'Throws an error' do
      expect { calc.add('-1000') }.to raise_error(
        StringCalculator::Input::NoNegativesAllowed,
        "negatives not allowed -1000"
      )
    end
  end

  context 'Calling with many negative numbers' do
    it 'Throws an error' do
      expect { calc.add('-1000,-2000,-3000') }.to raise_error(
        StringCalculator::Input::NoNegativesAllowed,
        "negatives not allowed -1000, -2000, -3000"
      )
    end
  end
end
