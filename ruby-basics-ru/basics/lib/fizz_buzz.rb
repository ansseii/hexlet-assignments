# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return nil if (stop - start).negative?
  (start..stop).map do |number|
    if (number % 3).zero? && (number % 5).zero?
      'FizzBuzz'
    elsif (number % 3).zero?
      'Fizz'
    elsif (number % 5).zero?
      'Buzz'
    else
      number
    end
  end
               .join(' ')
end

# END

puts fizz_buzz(11, 20)
