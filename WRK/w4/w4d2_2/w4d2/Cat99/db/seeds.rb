# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
d = Date.today
Cat.create!(
  birth_date: d,
  age: 0,
  color: "Orange",
  name: "Joe",
  sex: "M",
  description: "I'm the best"
  )

Cat.create!(
  birth_date: d-765,
  age: 2,
  color: "Orange",
  name: "King",
  sex: "M",
  description: "I'm the second best"
  )

CatRentalRequest.create!(
  cat_id: 1,
  start_date: d- 1000,
  end_date: d + 1000,
  status: "APPROVED"
)

CatRentalRequest.create!(
  cat_id: 1,
  start_date: d- 500,
  end_date: d + 500
)
