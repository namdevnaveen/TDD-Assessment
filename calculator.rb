class Calculator
  def self.add(numbers)
    if numbers == ""
      return 0
    elsif numbers.length == 1
      return numbers.to_i
    elsif numbers.length == 3
      numbers.split(',').map(&:to_i).sum
    else
      delimiters = %w[, \n // ;]
      digits = numbers.split(Regexp.union(delimiters)).map(&:to_i)
      digits.delete(0)
      if digits.length == 1
        return "invalid"
      else
        return digits.sum
      end
    end
  end
end