# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'without limit' do
    it 'returns all records' do
      expect(described_class.hottest(Time.current, nil)).to_not be_empty
    end
  end

  context 'with limit' do
    it 'returns records up to the limit' do
      expect((described_class.hottest(Time.current, 5)).size).to be <= 5
    end
  end
end
