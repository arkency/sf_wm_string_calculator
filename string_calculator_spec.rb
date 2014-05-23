require './string_calculator'

describe StringCalculator do

  subject(:calc) { StringCalculator.new }

  context 'Adding empty string' do
    it 'should return 0' do
      calc.add("").should eq(0)
    end
  end

  context 'Adding one number in string' do
    it 'should return 2' do
      calc.add("2").should eq(2)
    end

    it 'should return -3' do
      calc.add("-3").should eq(-3)
    end
  end

  context 'Adding two numbers in string' do
    it 'should return 14' do
      calc.add("8,6").should eq(14)
    end

    it 'should return -3' do
      calc.add("-4,1").should eq(-3)
    end

    it 'should return -30' do
      calc.add("-16,-14").should eq(-30)
    end
  end

  context 'Adding unlimited amount of numbers' do
    specify { expect(calc.add('1,2,3,4,5')).to eq(15) }
  end
end
