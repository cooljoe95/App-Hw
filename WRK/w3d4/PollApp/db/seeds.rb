# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
jared = User.create!(user_name: "jared")
joe = User.create!(user_name: "joe")
jane = User.create!(user_name: "jane")
jim = User.create!(user_name: "jim")
jon = User.create!(user_name: "jon")

Poll.destroy_all
poll1 = Poll.create!(title: "Coding Bootcamps", author_id: jared.id)
poll2 = Poll.create!(title: "Restaurants", author_id: joe.id)

Question.destroy_all
q1 = Question.create!(text: "Who is the best NYC coding bootcamp?", poll_id: poll1.id)
q2 = Question.create!(text: "Who is the hardest NYC coding bootcamp to get into?", poll_id: poll1.id)
q3 = Question.create!(text: "What is your favorite Chinese restaurant?", poll_id: poll2.id)
q4 = Question.create!(text: "What is your favorite Italian restaurant?", poll_id: poll2.id)

AnswerChoice.destroy_all
# for q1 and q2
ac1 = AnswerChoice.create!(text: "AppAcademy", question_id: q1.id)
ac2 = AnswerChoice.create!(text: "Flatiron", question_id: q1.id)
ac3 = AnswerChoice.create!(text: "AppAcademy", question_id: q2.id)
ac4 = AnswerChoice.create!(text: "Flatiron", question_id: q2.id)

# for q3 and q4
ac5 = AnswerChoice.create!(text: "Lucky Star", question_id: q3.id)
ac6 = AnswerChoice.create!(text: "Panda Express", question_id: q3.id)
ac7 = AnswerChoice.create!(text: "Parisi", question_id: q4.id)
ac8 = AnswerChoice.create!(text: "Famiglia", question_id: q4.id)

Response.destroy_all
Response.create!(user_id: jon.id, answer_choice_id: ac2.id)
Response.create!(user_id: jane.id, answer_choice_id: ac3.id)
Response.create!(user_id: jim.id, answer_choice_id: ac4.id)
Response.create!(user_id: jim.id, answer_choice_id: ac1.id)
Response.create!(user_id: jim.id, answer_choice_id: ac5.id)
Response.create!(user_id: jim.id, answer_choice_id: ac7.id)
Response.create!(user_id: jared.id, answer_choice_id: ac6.id)
Response.create!(user_id: joe.id, answer_choice_id: ac1.id)
Response.create!(user_id: joe.id, answer_choice_id: ac3.id)
