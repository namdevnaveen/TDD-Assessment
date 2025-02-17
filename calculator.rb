class Calculator
  attr_reader :numbers
  DELIMITERS = %w[, \n // ;]

  def initialize(str)
    @numbers = str
  end

  def add
    return 0 if @numbers == ""
    return @numbers.to_i if @numbers.length == 1

    digits = extract_digits
    handle_negative_numbers(digits)

    return "invalid" if digits.length == 1
    digits.sum
  end

  private

  def extract_digits
    arr = @numbers.split(Regexp.union(DELIMITERS)).map(&:to_i)
    arr.delete(0)
    arr
  end

  def handle_negative_numbers(digits)
    negative_numbers = check_for_negative_number(digits)

    raise "negative numbers not allowed: #{negative_numbers.join(',')}" if negative_numbers.is_a?(Array)
  end

  def check_for_negative_number(arr)
    negative_numbers = []
    arr.each do |num|
      negative_numbers << num if num < 0urn digits.sum
    end
    negative_numbers.empty? ? true : negative_numbers
  end
end