# frozen_string_literal: true

module Api
  module V1
    class QuestionsController < ApplicationController
      def hottest
        last_updated_at = Question.last_updated_at
        if stale?(last_updated_at)
          @questions = Question.hottest(last_updated_at, params[:quantity])
          if @questions
            render json: { data: @questions }
          else
            render json: { error: 'Failed to retrieve information' }, status: :unprocessable_entity
          end
        end
      end

      def most_accessed
        last_updated_at = Question.last_updated_at
        if stale?([last_updated_at, params[:period]])
          @questions = QuestionAccess.most_accessed_in_period(params[:period])
          if @questions
            render json: @questions.to_json
          else
            render json: { error: 'Failed to retrieve information' }, status: :unprocessable_entity
          end
        end
      end
    end
  end
end
