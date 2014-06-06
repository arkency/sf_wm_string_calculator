require './string_calculator'

describe StringCalculator::Calculator do

  subject(:calc) { StringCalculator::Calculator.new }

  context 'Adding empty string' do
    it 'should return 0' do
      calc.add("").should eq(0)
    end

    it 'should return 2' do
      calc.add("2").should eq(2)
    end
  end

  context 'Adding two numbers in string' do
    it 'should return 14' do
      calc.add("8,6").should eq(14)
    end
  end

  context 'Adding unlimited amount of numbers' do
    specify { expect(calc.add('1,2,3,4,5')).to eq(15) }
  end

  context 'Handles newlines between numbers' do
    specify { expect(calc.add('1\n2,3')).to eq(6)  }
  end

  context 'Handles many delimiters' do
    it 'Should return 12' do
      calc.add("//@\n1@1@10").should eq(12)
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
end
