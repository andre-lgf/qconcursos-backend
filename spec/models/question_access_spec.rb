# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionAccess, type: :model do
  context 'validates passed period' do
    context 'invalid period' do
      it 'fails' do
        expect((described_class.most_accessed_in_period('aaaa')).key?(:error)).to be_truthy
      end
    end

    context 'missing period' do
      it 'fails' do
        expect((described_class.most_accessed_in_period(nil)).key?(:error)).to be_truthy
      end
    end

    context 'valid period' do
      it 'works' do
        expect(described_class.most_accessed_in_period('week')).to_not be_empty
      end
    end
  end
end
