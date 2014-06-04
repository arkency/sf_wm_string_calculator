class StringCalculator
  def add(expression)
    extract_numbers(expression).inject(0,:+)
  end

  private

  def extract_numbers(expression)
    expression.split(/[,\\n]/).map(&:to_i)
  end
end
