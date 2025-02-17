# frozen_string_literal: true
require 'minitest/autorun'
require './calculator.rb'

# CalculatorTest
class CalculatorTest < Minitest::Test
  def test_null_string
    assert_equal 0, Calculator.add('')
  end

  def test_one_digit
    assert_equal 5, Calculator.add('5')
  end

  def test_one_non_digit
    assert_equal 0, Calculator.add(',')
  end

  def test_sum_two_digits
    assert_equal 6, Calculator.add('2,4')
  end

  def test_sum_leading_delimiter
    assert_equal "invalid", Calculator.add(',,4')
  end

  def test_sum_trailing_delimiter
    assert_equal "invalid", Calculator.add('4,,')
  end

  def test_sum_no_digit
    assert_equal 0, Calculator.add('/,,')
  end

  def test_input_with_blank
    assert_equal 0, Calculator.add('   ')
  end

  def test_input_with_more_digits
    assert_equal 15, Calculator.add('1,2,3,4,5')
  end
 
  def test_invalid_input
    assert_equal "invalid", Calculator.add('1,\n')
  end
 
  def test_different_delimiter
    assert_equal 3, Calculator.add('//;\n1;2')
  end

  def test_one_negative_number_input
    assert_raises(RuntimeError) { Calculator.add('1,-2') }
    exception = assert_raises(RuntimeError) { Calculator.add('1,-2') }
    assert_equal("negative numbers not allowed: -2", exception.message)
  end

  def test_multiple_negative_number_input
    exception = assert_raises(RuntimeError) { Calculator.add('1,-4,5,-23,-2') }
    assert_equal("negative numbers not allowed: -4,-23,-2", exception.message)

  end
end