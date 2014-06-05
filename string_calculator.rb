class StringCalculator
  DEFAULT_DELIMETER = /[,\\n]/

  def add(expression)
    extract_numbers(expression).inject(0,:+)
  end

  private

  def extract_numbers(expression)
    _, custom_delimeter, string = expression.match(%r{(\/\/(.{1}))?[\n]?(.*)}).captures
    delimeter = custom_delimeter || DEFAULT_DELIMETER
    string.to_s.split(delimeter).map(&:to_i)
  end
end
