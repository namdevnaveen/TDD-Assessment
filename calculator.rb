class Calculator
  def self.add(numbers)
    if numbers == ""
      return 0
    elsif numbers.length == 1
      return numbers.to_i
    elsif numbers.length == 3
      numbers.split(',').map(&:to_i).sum
    else
      
    end
  end
end