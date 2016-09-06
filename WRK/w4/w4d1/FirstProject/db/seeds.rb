# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


a = User.create!(username: 'a')
b = User.create!(username: "b")
c = User.create!(username: 'c')
d = User.create!(username: "d")

c1 = Contact.create!(name: "joe", user_id: c.id, email: 'asdf@dsfkjh.com' )
c2 = Contact.create!(name: "jon", user_id: a.id, email: 'sadf@dsfkjh.com' )
c3 = Contact.create!(name: "jane", user_id: b.id, email: 'asdf@dsfkjh.com' )
c4 = Contact.create!(name: "jen", user_id: d.id, email: 'aaSDF@dsfkjh.com' )

ContactShare.create!(user_id: a.id , contact_id: c1.id) #USER A HAS RECIEVED A CONTACT OWNED BY B
ContactShare.create!(user_id: d.id , contact_id: c2.id) #USER A HAS RECIEVED A CONTACT OWNED BY B
ContactShare.create!(user_id: a.id , contact_id: c3.id) #USER A HAS RECIEVED A CONTACT OWNED BY B
