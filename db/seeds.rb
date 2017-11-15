# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(first_name: "John", last_name: "Durand", date_of_birth: "10/11/1992", email: "jdurand@gmail.com", password: "jdurand1992", phone_number: "+3355628745")
user.save!

user_list = [
 [first_name: "José", last_name: "Doncalves" date_of_birth: "11/02/1987" , phone_number: "0545879562"],
 [first_name: "Patrick", last_name: "Chirac" date_of_birth: "11/05/1956" , phone_number: "065479562"],
 [first_name: "Johnny", last_name: "Cadillac" date_of_birth: "05/02/1989" , phone_number: "0631245559"],
 [first_name: "Donald", last_name: "Trump" date_of_birth: "21/08/1962" , phone_number: "0689579570"],
 [first_name: "Sebastien", last_name: "Patoche" date_of_birth: "03/06/1980" , phone_number: "0678952375"],
 [first_name: "Helmut", last_name: "Verthapen" date_of_birth: "12/12/1974" , phone_number: "0652148762"]
]


 user_list.each do |first_name, last_name, date_of_birth, phone_number|
  user.create!(first_name: first_name, last_name: last_name, date_of_birth: date_of_birth, phone_number: phone_number)
end




Rv.create!(name: "La Grosse Bertha", number_of_guests: 6, localisation: "Marseille", kind: "Large", number_of_beds: 6, price_per_night: 150, min_stay: 3, user_id: 3)
Rv.create!(name: "Chiquita", number_of_guests: 5, localisation: "Bordeaux", kind: "Compact", number_of_beds: 5, price_per_night: 100, min_stay: 3, user_id: 1)
Rv.create!(name: "Le Wagon", number_of_guests: 2, localisation: "Castelnaudary", kind: "Standard", number_of_beds: 2, price_per_night: 50, min_stay: 3, user_id: 2)
Rv.create!(name: "Guertrud", number_of_guests: 4, localisation: "Amsterdam", kind: "Compact", number_of_beds: 5, price_per_night: 120, min_stay: 3, user_id: 6)
Rv.create!(name: "American Patriot", number_of_guests: 6, localisation: "Washington", kind: "Large", number_of_beds: 6, price_per_night: 150, min_stay: 3, user_id: 4)
Rv.create!(name: "Discover Express", number_of_guests: 3, localisation: "Nantes", kind: "Standard", number_of_beds: 3, price_per_night: 65, min_stay: 3, user_id: 6)
Rv.create!(name: "La Limo de Tonton", number_of_guests: 7, localisation: "Toulouse", kind: "Large", number_of_beds: 7, price_per_night: 150, min_stay: 3, user_id: 3)


Booking.create!(number_of_guests: 4, price: 300, check_in_on: "12/08/2018", check_in_out: "14/08/2018", status: "Pending", rv_id: 1, user_id: 5)
Booking.create!(number_of_guests: 2, price: 800, check_in_on: "30/08/2018", check_in_out: "15/09/2018", status: "Pending", rv_id: 3, user_id: 5)
Booking.create!(number_of_guests: 2, price: 300, check_in_on: "11/07/2018", check_in_out: "16/07/2018", status: "Pending", rv_id: 7, user_id: 1)
