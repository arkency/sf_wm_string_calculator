class StringCalculator
  def add(numbers)
    numbers.gsub(/\\n/,",").split(',').map(&:to_i).inject(0,:+)
  end
end
