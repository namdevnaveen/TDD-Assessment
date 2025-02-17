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
    assert_equal 6, Calculator.add('2,3')
  end
end