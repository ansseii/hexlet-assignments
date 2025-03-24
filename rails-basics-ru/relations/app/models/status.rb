# frozen_string_literal: true

class Status < ApplicationRecord
  # BEGIN
  VALID_STATUSES = %w[new in_progress done].map(&:titleize)

  validates :name, presence: true, inclusion: { in: VALID_STATUSES }

  belongs_to :task
  # END
end
