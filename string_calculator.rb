class StringCalculator
  def add(expression)
    extract_numbers(expression).inject(0,:+)
  end

  private

  def extract_numbers(expression)
    expression.gsub(/\\n/,",").split(',').map(&:to_i)
  end
end
