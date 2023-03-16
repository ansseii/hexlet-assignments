# frozen_string_literal: true

# BEGIN
def build_query_string(params = {})
  params.keys.sort
        .map { |param| "#{param}=#{params[param]}" }
        .join('&')
end

# END
