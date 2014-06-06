module StringCalculator 
  class Calculator
    def add(expression)
      input = Input.new(expression)
      numbers = input.extract_numbers
      numbers.inject(0,:+)
    end
  end

  class Input
    DEFAULT_DELIMETER = /[,\\n]/

    class NoNegativesAllowed < StandardError; end

    def initialize(input)
      @input = input
    end

    def extract_numbers
      _, custom_delimeter, string = @input.match(%r{(\/\/(.{1}))?[\n]?(.*)}).captures
      delimeter = custom_delimeter || DEFAULT_DELIMETER
      numbers = string.to_s.split(delimeter).map(&:to_i)
      check_numbers(numbers)
      numbers
    end

    private
    def check_numbers(numbers)
      check_for_negatives(numbers) 
    end

    def check_for_negatives(numbers)
      negative = numbers.select { |num| num < 0 }.first
      raise NoNegativesAllowed.new("negatives not allowed #{negative}") unless negative.nil?
    end
  end
end
