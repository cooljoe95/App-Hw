User.destroy_all
(1..100).each do |num|
  User.create(username: num.to_s, password: "password", email: Faker::Internet.email)
end

Cat.destroy_all
(1..100).to_a.shuffle.each do |num|
  Cat.create(
    birth_date: Faker::Date.between(10.years.ago, Date.today),
    color: Cat::CAT_COLORS.sample,
    name: Faker::Name.name,
    sex: %w(F M).sample,
    description: Faker::Hipster.sentence,
    user_id: num
  )
end

CatRentalRequest.destroy_all
100.times do
  start_date = Faker::Date.forward(365)
  CatRentalRequest.create(
    cat_id: 1,
    start_date: start_date,
    end_date: Faker::Date.between(start_date, start_date + 30),
    user_id: (1..100).to_a.sample
  )
end
