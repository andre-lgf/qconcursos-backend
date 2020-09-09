# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :statement
      t.text :text
      t.string :answer, limit: 1
      t.integer :daily_access
      t.string :discipline

      t.timestamps
    end
    add_index :questions, :discipline
    add_index :questions, :daily_access
    add_index :questions, %i[discipline daily_access]
  end
end
