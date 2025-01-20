# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_stack_push
    stack = Stack.new

    stack.push! 1
    stack.push! 2
    stack.push! 3

    assert { stack.to_a == [1, 2, 3] }
  end

  def test_stack_pop
    stack = Stack.new [1, 2]

    stack.push! 3

    top = stack.pop!
    assert { top == 3 }
    assert { stack.to_a == [1, 2] }
    top = stack.pop!
    assert { top == 2 }
    assert { stack.to_a == [1] }
    top = stack.pop!
    assert { top == 1 }
    assert { stack.to_a == [] }

    stack.pop!
    assert { stack.to_a == [] }
  end

  def test_stack_clear
    stack = Stack.new [1, 2, 3]

    stack.clear!

    assert { stack.empty? }
  end

  def test_stack_size
    stack = Stack.new [1]
    assert { stack.size == 1 }

    stack.push! 2
    stack.push! 3
    assert { stack.size == 3 }

    stack.pop!
    assert { stack.size == 2 }

    stack.pop!
    stack.pop!
    stack.pop!
    assert { stack.size.zero? }
  end

  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
