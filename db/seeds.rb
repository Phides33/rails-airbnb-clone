# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Rv.destroy_all
Booking.destroy_all

user1 = User.new(first_name: "John", last_name: "Durand", date_of_birth: "10/11/1992", email: "jdurand@gmail.com", password: "jdurand1992", phone_number: "+3355628745")
user1.save!
user2 = User.new(first_name: "JJ", last_name: "Cale", date_of_birth: "10/11/1992", email: "jj@gmail.com", password: "123456", phone_number: "+3355628745")
user2.save!
user3 = User.new(first_name: "Peter", last_name: "Pan", date_of_birth: "25/03/1875", email: "pp@gmail.com", password: "123456", phone_number: "+4455628745")
user3.save!

rv1 = Rv.new(user_id: user1.id, name: "Vintage woody", localisation: "Urrugne", kind: "Compact", number_of_beds: 2, number_of_guests: 2, price_per_night: 10, min_stay: 2)
rv1.save!
rv2 = Rv.new(user_id: user3.id, name: "Early century", localisation: "Paris", kind: "Compact", number_of_beds: 3, number_of_guests: 3, price_per_night: 20, min_stay: 4)
rv2.save!
rv3 = Rv.new(user_id: user1.id, name: "Barely RV", localisation: "Tulle", kind: "Compact", number_of_beds: 2, number_of_guests: 2, price_per_night: 10, min_stay: 2)
rv3.save!
rv4 = Rv.new(user_id: user2.id, name: "For my Mini RV", localisation: "Bordeaux", kind: "Large", number_of_beds: 6, number_of_guests: 6, price_per_night: 80, min_stay: 2)
rv4.save!
rv5 = Rv.new(user_id: user2.id, name: "Escalator RV", localisation: "Marseille", kind: "Large", number_of_beds: 5, number_of_guests: 5, price_per_night: 120, min_stay: 2)
rv5.save!
rv6 = Rv.new(user_id: user3.id, name: "Jetsons RV", localisation: "Toulouse", kind: "Standard", number_of_beds: 4, number_of_guests: 4, price_per_night: 55, min_stay: 5)
rv6.save!

b = Booking.new(user_id: user1.id, rv_id: rv2.id, check_in_on: "15/03/2017", check_out_on: "20/03/2017", price: 100, status: "Accepted", rating: 3, review: "The hinges squeak during transfers. The victorian glasses are splendid, as is the four poster bed!")
b.save!
b = Booking.new(user_id: user1.id, rv_id: rv5.id, check_in_on: "03/07/2017", check_out_on: "18/07/2017", price: 1800, status: "Accepted", rating: 5, review: "My boys just loved to run up the escalator and jump into the lake. We had a great time touring Marseille. I strongly recommend!")
b.save!
b = Booking.new(user_id: user2.id, rv_id: rv3.id, check_in_on: "10/10/2017", check_out_on: "12/10/2017", price: 20, status: "Accepted", rating: 1, review: "What a disgrace. The name should have warned me: never got out of the parking lot !?**Grrr!!!")
b.save!
b = Booking.new(user_id: user2.id, rv_id: rv6.id, check_in_on: "10/04/2016", check_out_on: "09/05/2016", price: 1650, status: "Accepted", rating: 4, review: "This particular road trip around the Midlands was a success. I felt geeky in this Jetsons RV and it was plain cool to jam on my stratocaster in it. Special XXX to Meg for the wonderful scones!")
b.save!
b = Booking.new(user_id: user3.id, rv_id: rv1.id, check_in_on: "15/03/2017", check_out_on: "20/03/2017", price: 50, status: "Accepted", rating: 3, review: "Took it to the entrance of Vallée d'Ossau and used it as a base camp to trek in the Pyrenees. It was cosy to sip tea by the wood furnace while relaxing sore feet after the day's hike.")
b.save!
b = Booking.new(user_id: user3.id, rv_id: rv4.id, check_in_on: "15/03/2017", check_out_on: "20/03/2017", price: 320, status: "Accepted", rating: 3, review: "Boy was I glad to keep my Mini safe in the boot and watch the hurricane scream by while watching The Get Down on Netflix!")
b.save!
b = Booking.new(user_id: user1.id, rv_id: rv2.id, check_in_on: "15/03/2017", check_out_on: "20/03/2017", price: 100, status: "Accepted", rating: 1, review: "There were fleas everywhere left by the previous guests: blighty dogs")
b.save!
b = Booking.new(user_id: user3.id, rv_id: rv5.id, check_in_on: "10/08/2017", check_out_on: "15/08/2017", price: 600, status: "Accepted", rating: 4, review: "Okay plus")
b.save!
b = Booking.new(user_id: user1.id, rv_id: rv4.id, check_in_on: "02/06/2017", check_out_on: "08/06/2017", price: 480, status: "Accepted", rating: 1, review: "The jacuzzi wasn't working!!!")
b.save!
