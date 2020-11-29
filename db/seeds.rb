# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

publisher = Publisher.create(name: 'Trung', email: 'trung@example.com', password: '12345678')
survey = Survey.create(publisher: publisher, title: 'Traveling', active: true)
Question.create([
  {
    survey: survey,
    title: 'Where is your favorite city?',
    options: ['Rome', 'Sydney', 'New York', 'Ha Noi']
  },
  {
    survey: survey,
    title: 'What is your packing of choice?',
    options: ['backpack', 'suitcase', 'no luggage']
  },
  {
    survey: survey,
    title: 'Who would you like to travel with?',
    options: ['partner', 'friends', 'by myself', 'family']
  }
])

