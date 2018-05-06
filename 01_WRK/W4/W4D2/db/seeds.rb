# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# date = Date.new stuff
# yr, m, d

Cat.destroy_all
CatRentalRequest.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('cats')
ActiveRecord::Base.connection.reset_pk_sequence!('catrentalrequests')

birthday_1 = Date.new(2017)
birthday_2 = Date.new(2016,6,1)

cat_one = Cat.new(name: "Daisy", birth_date: birthday_1, color: 'Black', sex: 'F', description: 'a friendly cat with a sunny disposition of bad luck')

cat_two = Cat.new(name: "Bob", birth_date: birthday_2, color: 'Green', sex: 'M', description: 'you can call a cat BOB!!!')

cat_one.save # here for error checking
cat_two.save # here for error checking

cat_rental_one = CatRentalRequest.new(cat_id: cat_one.id, start_date: Date.new(2018), end_date: Date.new(2018,3,1))

cat_rental_two = CatRentalRequest.new(cat_id: cat_two.id, start_date: Date.new(2018), end_date: Date.new(2018,6,1))

cat_rental_one.save # here for error checking
cat_rental_two.save # here for error checking
