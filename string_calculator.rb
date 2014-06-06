module StringCalculator
  class Calculator
    def add(expression)
      numbers = get_numbers(expression)
      numbers.inject(0,:+)
    end

    def get_numbers(expression)
      input = Input.new(expression)
      numbers = input.get_numbers
    end
  end

  class Input
    DEFAULT_DELIMETER = /[,\\n]/

    class NoNegativesAllowed < StandardError; end

    def initialize(input)
      @input = input
    end

    def get_numbers
      numbers = extract_numbers
      check_numbers(numbers)
      numbers
    end

    private
    def extract_numbers
      _, custom_delimeter, string = @input.match(%r{(\/\/(.{1}))?[\n]?(.*)}).captures
      delimeter = custom_delimeter || DEFAULT_DELIMETER
      string.to_s.split(delimeter).map(&:to_i)
    end

    def check_numbers(numbers)
      check_for_negatives(numbers)
    end

    def check_for_negatives(numbers)
      numbers.select { |num| num < 0 }.tap do |negatives|
        raise NoNegativesAllowed.new("negatives not allowed #{negatives.join(', ')}") unless negatives.empty?
      end
    end
  end
end
