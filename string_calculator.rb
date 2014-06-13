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
    DEFAULT_DELIMITER = ","

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
      delimiter = get_delimiter
      @input = sanitize_input(delimiter) unless delimiter == '\n' 
      @input.split(delimiter).map(&:to_i)
    end

    def get_delimiter
      return get_custom_delimiter if @input.start_with?("//")
      DEFAULT_DELIMITER
    end

    def get_custom_delimiter
      @input[2]
    end

    def sanitize_input(delimiter)
      @input.gsub(/\n+/, delimiter)
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
