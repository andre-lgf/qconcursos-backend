# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Questions', type: :request do
  describe 'GET /hottest' do
    it 'returns http success' do
      get '/api/v1/questions/hottest'
      expect(response).to have_http_status(:success)
    end

    it 'returns the list of hottest discipline, ordered by desc' do
      get '/api/v1/questions/hottest'
      expect(response.body).to_not be_empty
    end
  end

  describe 'GET /most_accessed' do
    it 'returns http success' do
      get '/api/v1/questions/most_accessed?period=year'
      expect(response).to have_http_status(:success)
    end

    it 'returns the most viewed questions in the period' do
      get '/api/v1/questions/most_accessed?period=year'
      expect(response.body).to_not be_empty
    end
  end
end
