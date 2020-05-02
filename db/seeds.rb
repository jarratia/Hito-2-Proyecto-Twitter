# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
#<User id: nil, email: "", name: "", profile_picture: nil, created_at: nil, updated_at: nil>
10.times do
    User.create(email: Faker::Internet.email, 
                name: Faker::Name.name,
                password: Faker::Internet.password)
end

50.times do
    #<Tweet id: nil, content: nil, user_id: nil, created_at: nil, updated_at: nil> 
    t = Tweet.create(
        content: Faker::Lorem.paragraph_by_chars(number: 280),
        user_id: rand(1..10)
    )

    numb = rand(0..1)
    if numb == 1
        Like.create(tweet: t, user_id: t.user_id)
    end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?