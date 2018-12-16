# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

t1 = Topic.create(name: 'Pollution')
t2 = Topic.create(name: 'Animals')
t3 = Topic.create(name: 'Culture')
t4 = Topic.create(name: 'History')
t5 = Topic.create(name: 'Philosophy')
t6 = Topic.create(name: 'Nature')
t7 = Topic.create(name: 'Natural sciences')
t8 = Topic.create(name: 'Health and fitness')
t9 = Topic.create(name: 'Geography')
t10 = Topic.create(name: 'Mathematics')

u = User.create(name: 'John',
                surname: 'Smith',
                email: 'j.m@test.com',
                password: '1234',
                password_confirmation: '1234')

c = City.create(name: 'Moscow')

e1 = Event.create(name: 'First Ever Event',
                 start_at: DateTime.now - 4.days,
                 end_at: DateTime.now - 3.days - 10.hours, city: c)
e1.topics.concat([t1, t4, t6])

e2 = Event.create(name: 'Second Event',
                 start_at: DateTime.now - 3.days,
                 end_at: DateTime.now - 2.days - 10.hours, city: c)
e2.topics.concat([t3, t5, t10, t4])