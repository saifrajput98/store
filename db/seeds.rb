# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([{
               first_name: 'Ali',
               last_name: 'Ahmed',
               email: 'aliahmed@gmail.com',
               password: 'aliahmed'
             },
              {
                first_name: 'Salman',
                last_name: 'Ahmed',
                email: 'salmanahmed@gmail.com',
                password: 'salmanahmed'
              }])
p "Created #{User.count} users"
