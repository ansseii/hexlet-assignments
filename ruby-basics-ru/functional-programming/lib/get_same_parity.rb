# frozen_string_literal: true

# BEGIN
def get_same_parity(array)
  return array if array.empty?

  parity = (array.first % 2).zero?
  array.filter { |item| (item % 2).zero? == parity }
end
# END
