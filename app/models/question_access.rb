# frozen_string_literal: true

class QuestionAccess < ApplicationRecord
  belongs_to :question, touch: true

  VALID_PERIODS = %w[month week year].freeze

  def self.most_accessed_in_period(period)
    unless VALID_PERIODS.include?(period&.downcase)
      return { error: "Invalid Period. Please choose between 'week', 'month' and 'year'" }
    end

    start_time = case period.downcase
                 when 'year' then Time.current.beginning_of_year
                 when 'month' then Time.current.beginning_of_month
                 when 'week' then Time.current.beginning_of_month
                 end

    Rails.cache.fetch("most_accessed/#{period.downcase}", expires_in: 1.hour) do
      where(date: start_time...Time.current).order(times_accessed: :desc)
    end
  end
end
