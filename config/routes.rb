# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'questions/hottest'
      get 'questions/most_accessed'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
