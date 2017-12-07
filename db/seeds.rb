# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', admin: true)
normal_user = User.create(email: 'user@test.com', password: '12345678', password_confirmation: '12345678')
kata = Kata.create(title: 'Kata test', description: 'Kata description test')
Belt.create(name: 'First belt', description: 'First belt description', kata: kata.id)
Belt.create(name: 'Second belt', description: 'Second belt description', kata: kata.id)
Example.create(text: 'An example', url: 'https://www.google.es', kata: kata.id)
Example.create(text: 'User example', url: 'https://www.google.es', kata: kata.id, user: normal_user.id)
external_kata = ExternalKata.create(name: 'External kata', url: 'http://www.google.es')
ExternalExample.create(text: 'External example', url: 'https://google.es', kata: external_kata.id, user: normal_user.id)