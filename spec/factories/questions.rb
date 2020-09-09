# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    statement { 'Lorem Ipsum' }
    text { 'Lorem ipsum dolor sit amet' }
    answer { %w[A B C D E].sample }
    daily_access { (rand * 1000).to_i }
    discipline { %w[portugues ingles direito medicina].sample }
  end
end
