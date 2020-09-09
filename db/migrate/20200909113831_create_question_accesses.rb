# frozen_string_literal: true

class CreateQuestionAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :question_accesses do |t|
      t.references :question, null: false, foreign_key: true
      t.datetime :date
      t.decimal :times_accessed

      t.timestamps
    end
    add_index :question_accesses, :date
    add_index :question_accesses, :times_accessed
    add_index :question_accesses, %i[date times_accessed]
  end
end
