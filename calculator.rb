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

      negative_numbers = check_for_negative_number(digits)

      raise "negative numbers not allowed: #{negative_numbers.join(',')}" if negative_numbers.is_a?(Array)

      digits.delete(0)

      return "invalid" if digits.length == 1
      digits.sum
    end
  end

  def self.check_for_negative_number(arr)
    negative_numbers = []
    arr.each do |num|
      negative_numbers << num if num < 0urn digits.sum
    end
    negative_numbers.empty? ? true : negative_numbers
  end
end