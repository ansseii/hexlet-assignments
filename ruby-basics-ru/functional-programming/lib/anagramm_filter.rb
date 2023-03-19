# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, candidates)
  sorted_word = word.chars.sort
  candidates.filter { |candidate| sorted_word == candidate.chars.sort }
end
# END
