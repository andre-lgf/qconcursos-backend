# frozen_string_literal: true

FactoryBot.define do
  factory :question_access do
    question
    date { Time.current - (rand * 100).to_i.days }
    times_accessed { (rand * 10_000).to_i }
  end
end
