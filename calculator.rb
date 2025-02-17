class Calculator
  def self.add(numbers)
    if numbers == ""
      return 0
    elsif numbers.length == 1
      return numbers.to_i
    end
  end
end