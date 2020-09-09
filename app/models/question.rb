# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :question_accesses, dependent: :destroy

  def self.hottest(last_update = nil, quantity)
    Rails.cache.fetch("Question-#{last_update || last_updated_at}/hottest", expires_in: 1.hour) do
      query = <<~SQL
        SELECT SUM(daily_access) access_count, discipline
          FROM questions
        GROUP BY discipline
        ORDER BY access_count desc
      SQL
      query += "LIMIT #{quantity}" if quantity&.positive?
      connection_pool.with_connection { |conn| conn.execute(query).to_a }
    end
  end

  scope :last_updated_at, -> { order(updated_at: :desc).limit(1).pluck(:updated_at) }
end
