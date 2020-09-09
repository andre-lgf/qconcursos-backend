# frozen_string_literal: true

require 'open-uri'

print 'Importing Questions... '
JSON.parse(URI.open('https://raw.githubusercontent.com/qcx/desafio-backend/master/questions.json').read).each do |q|
  Question.create q
rescue StandardError
  nil
  # ignores duplicates
end
p 'Done.'

print 'Importing Question Accesses... '
JSON.parse(URI.open('https://raw.githubusercontent.com/qcx/desafio-backend/master/question_access.json').read).each do |qa|
  QuestionAccess.create qa
end
p 'Done.'
