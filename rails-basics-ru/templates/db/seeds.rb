# frozen_string_literal: true

require 'faker'

STATUSES = %i[new in_progress done].freeze

10.times do
  Task.create(
    name: Faker::Name.name,
    description: Faker::Lorem.sentence,
    status: STATUSES.sample,
    creator: Faker::Movies::HarryPotter.character,
    performer: Faker::Movies::HarryPotter.character,
    completed: Faker::Boolean.boolean
  )
end
