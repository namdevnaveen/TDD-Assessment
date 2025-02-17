# frozen_string_literal: true
require 'minitest/autorun'
require './calculator.rb'

# CalculatorTest
class CalculatorTest < Minitest::Test
  def test_null_string
    assert_equal 0, Calculator.new('').add
  end

  def test_one_digit
    assert_equal 5, Calculator.new('5').add
  end

  def test_one_non_digit
    assert_equal 0, Calculator.new(',').add
  end

  def test_sum_two_digits
    assert_equal 6, Calculator.new('2,4').add
  end

  def test_sum_leading_delimiter
    assert_equal "invalid", Calculator.new(',,4').add
  end

  def test_sum_trailing_delimiter
    assert_equal "invalid", Calculator.new('4,,').add
  end

  def test_sum_no_digit
    assert_equal 0, Calculator.new('/,,').add
  end

  def test_input_with_blank
    assert_equal 0, Calculator.new('   ').add
  end

  def test_input_with_more_digits
    assert_equal 15, Calculator.new('1,2,3,4,5').add
  end
 
  def test_invalid_input
    assert_equal "invalid", Calculator.new('1,\n').add
  end
 
  def test_different_delimiter
    assert_equal 3, Calculator.new('//;\n1;2').add
  end

  def test_single_negative_number_input
    exception = assert_raises(RuntimeError) { Calculator.new('-2').add }
    assert_equal("negative numbers not allowed: -2", exception.message)
  end

  def test_one_negative_number_input
    assert_raises(RuntimeError) { Calculator.new('1,-2') }
    exception = assert_raises(RuntimeError) { Calculator.new('1,-2').add }
    assert_equal("negative numbers not allowed: -2", exception.message)
  end

  def test_multiple_negative_number_input
    exception = assert_raises(RuntimeError) { Calculator.new('1,-4,5,-23,-2').add }
    assert_equal("negative numbers not allowed: -4,-23,-2", exception.message)

  end
end