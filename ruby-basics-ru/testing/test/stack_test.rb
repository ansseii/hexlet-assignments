# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_stack_push
    actual = Stack.new

    actual.push! 1
    actual.push! 2
    actual.push! 3

    assert { actual.to_a == [1, 2, 3] }
  end

  def test_stack_pop
    actual = Stack.new([1, 2, 3])

    actual.pop!
    assert { actual.to_a == [1, 2] }

    actual.pop!
    actual.pop!
    actual.pop!
    assert { actual.to_a == [] }
  end

  def test_stack_clear
    actual = Stack.new([1, 2, 3])

    actual.clear!
    assert { actual.to_a == [] }
  end

  def test_stack_size
    actual = Stack.new

    assert { actual.empty? }
    actual.push! 5
    assert { actual.size == 1 }
    actual.push! 4
    actual.push! 3
    assert { actual.size == 3 }

    actual.pop!
    actual.pop!
    assert { actual.size == 1 }
  end

  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
