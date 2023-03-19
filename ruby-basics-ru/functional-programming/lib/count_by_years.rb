# frozen_string_literal: true

# BEGIN
def count_by_years(data)
  data.filter { |item| item[:gender] == 'male' }
      .each_with_object({}) do |row, hash|
    year = row[:birthday][0, 4]
    hash[year] ||= 0
    hash[year] += 1
  end
end

# END
