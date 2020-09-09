# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_909_113_831) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'question_accesses', force: :cascade do |t|
    t.bigint 'question_id', null: false
    t.datetime 'date'
    t.decimal 'times_accessed'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[date times_accessed], name: 'index_question_accesses_on_date_and_times_accessed'
    t.index ['date'], name: 'index_question_accesses_on_date'
    t.index ['question_id'], name: 'index_question_accesses_on_question_id'
    t.index ['times_accessed'], name: 'index_question_accesses_on_times_accessed'
  end

  create_table 'questions', force: :cascade do |t|
    t.text 'statement'
    t.text 'text'
    t.string 'answer', limit: 1
    t.integer 'daily_access'
    t.string 'discipline'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['daily_access'], name: 'index_questions_on_daily_access'
    t.index %w[discipline daily_access], name: 'index_questions_on_discipline_and_daily_access'
    t.index ['discipline'], name: 'index_questions_on_discipline'
  end

  add_foreign_key 'question_accesses', 'questions'
end
