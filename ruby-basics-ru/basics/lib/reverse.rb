# frozen_string_literal: true

# BEGIN
def reverse(str)
  reversed = ''
  str.each_char { |char| reversed = "#{char}#{reversed}" }
  reversed
end
# END
