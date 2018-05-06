# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## DESTROY ALL HUMANS ##
User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all
## ## ## ## ## ## ## ##

## RESET ALL HUMANS ##
ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('polls')
ApplicationRecord.connection.reset_pk_sequence!('questions')
ApplicationRecord.connection.reset_pk_sequence!('answer_choices')
ApplicationRecord.connection.reset_pk_sequence!('responses')
## ## ## ## ## ## ## ##

## CREATE SOME HUMANS ##
User.create!(name: "Bill")
User.create!(name: "Raykwan")
User.create!(name: "Bob")

Poll.create!(title: "People who like horses", user_id: User.all.first.id)
Poll.create!(title: "People who like Raykawn", user_id: User.all.second.id)
Poll.create!(title: "People who eat pasta", user_id: User.all.second.id)

Question.create!(query: "Do you like horses?", poll_id: Poll.all.first.id)
Question.create!(query: "DO YOU LIKE RAYKWAN?", poll_id: Poll.all.second.id)
Question.create!(query: "Do you eat pasta?", poll_id: Poll.all.third.id)

AnswerChoice.create!(answer: "Very much!", question_id: Question.all.first.id)
AnswerChoice.create!(answer: "DEFINITELY", question_id: Question.all.second.id)
AnswerChoice.create!(answer: "I'm allergic...That wasn't pasta just now, was it? Oh god.", question_id: Question.all.third.id)

Response.create!(user_id: User.all.first.id, answer_choice_id: AnswerChoice.all.first.id)
Response.create!(user_id: User.all.second.id, answer_choice_id: AnswerChoice.all.first.id)
Response.create!(user_id: User.all.third.id, answer_choice_id: AnswerChoice.all.third.id)

## ## ## ## ## ## ## ##
