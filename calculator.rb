class Calculator
  attr_reader :numbers
  DELIMITERS = %w[, \n // ; * %]

  def initialize(str, operator = '+')
    @numbers = str
    @operator = operator
  end

  def add
    return 0 if @numbers == ""
    return @numbers.to_i if @numbers.length == 1

    digits = extract_digits
    digits = sanitize_digits(digits)
    handle_negative_numbers(digits)

    return "invalid" if digits.length == 1

    perform_operation(digits)
  end

  private

  def perform_operation(digits)
    case @operator
    when '*'
      result = digits.inject(1){ |p, e| e == 0 ? p : p * e }
    else
      result = digits.sum
    end
    result
  end

  def sanitize_digits(digits)
    digits.map { |digit| digit < 1001 ? digit : 0 }
  end

  def extract_digits
    arr = @numbers.split(Regexp.union(DELIMITERS)).map(&:to_i)
    arr.delete(0)
    arr
  end

  def handle_negative_numbers(digits)
    negative_numbers = check_for_negative_number(digits)

    raise "negative numbers not allowed: #{negative_numbers.join(',')}" unless negative_numbers.empty?
  end

  def check_for_negative_number(arr)
    negative_numbers = []
    arr.each do |num|
      negative_numbers << num if num < 0urn digits.sum
    end
    negative_numbers
  end
end