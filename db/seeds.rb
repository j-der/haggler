require 'faker'

# Create main user
User.delete_all
Post.delete_all

user1 = User.create!(
  username: "Tessa",
  email: 'tessa@example.com',
  password: '123'
)

user2 = User.create!(
  username: "Jas",
  email: 'jas@example.com',
  password: '123'
)

user3 = User.create!(
  username: "Niloo",
  email: 'niloo@example.com',
  password: '123'
)

user4 = User.create!(
  username: "Shady",
  email: 'shady@example.com',
  password: '123'
)

User.all.each do |u|
  5.times do
    title = Faker::Commerce.product_name
    description = Faker::Hipster.paragraph(8, true)
    category = ["goods", "skills"].sample
    url = ["http://lorempixel.com/380/380/technics", "http://lorempixel.com/380/380/food/", "http://lorempixel.com/380/380/cats/", "http://lorempixel.com/380/380/people/"].sample
    traded = [true, false].sample
    like_count = (0..20).to_a.sample
    latitude = Faker::Address.latitude
    longitude = Faker::Address.longitude

    u.posts.create!(
      title: title,
      description: description,
      category: category,
      image_url: url,
      traded: traded,
      like_count: like_count,
      latitude: latitude,
      longitude: longitude
    )

  end
end
