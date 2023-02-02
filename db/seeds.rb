# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.first_or_create(email: ' admin@projectname.com') do |user|
  user.first_name = 'admin'
  user.last_name = 'campencounter'
  user.country = 'pakistan'
  user.phone_number = '03194773106'
  user.password = 'Password123!@#'
end

SuperAdmin.first_or_create(email: ' Superadmin@projectname.com') do |user|
  user.first_name = 'admin'
  user.last_name = 'campencounter'
  user.country = 'pakistan'
  user.phone_number = '03194773106'
  user.password = 'Abcd123!@#'
end
