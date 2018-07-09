# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |i|
  User.create(
  username: Faker::LeagueOfLegends.champion,
  email: "#{i+1}@#{i+1}",
  password: 123123,
  password_confirmation: 123123
  )
end

(1..10).each do |i|
  Post.create(title: Faker::Pokemon.name, content: Faker::OnePiece.quote, user_id: i)
end

(1..10).each do |i|
  Post.find(i).comments.create(content: Faker::OnePiece.quote)
end

=begin
CSV.foreach(Rails.root.join("seed.csv"), headers: true) do |row|
  Post.create! row.to_hash
end
=end
CSV.foreach(Rails.root.join("school.csv"), headers: true) do |row|
  School.create! row.to_hash
end
