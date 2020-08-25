# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Invitee.destroy_all
ViewParty.destroy_all

 Friendship.destroy_all
 User.destroy_all
#drop create, migrate,seed instead of destroy.all

## Users
john = User.create(first_name: "John", last_name: "Smith", email: "john@email.com" )
jane = User.create(first_name: "Jane", last_name: "Doe", email: "jane@email.com")
lito = User.create(ENV["LITO"])

##Friendship
Friendship.create(user_id: lito.id, friend_id: john.id)

## View Viewing Parties
viewing_party_1 = ViewParty.create(movie_title: "Caddyshack", when: "2020-09-27 11:00:00", duration: 120, user_id: john.id)

## Invitees
Invitee.create(view_party_id: viewing_party_1.id, user_id: lito.id, accepted?: true)
