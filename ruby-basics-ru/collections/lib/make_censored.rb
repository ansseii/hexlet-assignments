# frozen_string_literal: true

def make_censored(text, stop_words)
  # BEGIN
  censored = '$#%!'
  text.split
      .map { |word| stop_words.include?(word) ? censored : word }
      .join(' ')
  # END
end
