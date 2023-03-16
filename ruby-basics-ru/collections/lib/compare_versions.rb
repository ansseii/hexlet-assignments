# frozen_string_literal: true

# BEGIN
def compare_versions(version1, version2)
  v1_major, v1_minor = version1.split('.').map(&:to_i)
  v2_major, v2_minor = version2.split('.').map(&:to_i)

  return 1 if v1_major > v2_major
  return -1 if v2_major > v1_major
  return 1 if v1_minor > v2_minor
  return -1 if v2_minor > v1_minor

  0
end
# END
