class StringCalculator

  def add(numbers)
    numbers.split(',').map(&:to_i).inject(0,:+)
  end

end
