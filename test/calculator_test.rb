# frozen_string_literal: true
require 'minitest/autorun'
require './calculator.rb'

# CalculatorTest
class CalculatorTest < Minitest::Test
  def test_null_string
    assert_equal 0, Calculator.add('')
  end

  def test_return_one_number
    assert_equal 5, Calculator.add('5')
  end
end