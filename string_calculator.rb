class StringCalculator
  DEFAULT_DELIMETER = /[,\\n]/

  def add(expression)
    numbers = extract_numbers(expression)
    check_for_negatives(numbers)
    numbers.inject(0,:+)
  end

  private
  def extract_numbers(expression)
    _, custom_delimeter, string = expression.match(%r{(\/\/(.{1}))?[\n]?(.*)}).captures
    delimeter = custom_delimeter || DEFAULT_DELIMETER
    string.to_s.split(delimeter).map(&:to_i)
  end

  def check_for_negatives(numbers)
    negative = numbers.select { |num| num < 0 }.first
    raise StandardError.new("negatives not allowed #{negative}") unless negative.nil?
  end
end
