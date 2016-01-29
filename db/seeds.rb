require 'faker'

# Create main user
User.delete_all
Post.delete_all

user1 = User.create!(
  email: 'seller@example.com',
  password: 'password'
)

user2 = User.create!(
  email: 'jas@example.com',
  password: 'der'
)

user3 = User.create!(
  email: 'haggler@example.com',
  password: 'hag'
)

User.all.each do |u|
  5.times do
    title = Faker::Commerce.product_name
    description = Faker::Hipster.paragraph(8, true)
    category = ["goods", "skills"].sample
    url = ["http://lorempixel.com/400/400/technics", "http://lorempixel.com/400/400/food/", "http://lorempixel.com/400/400/cats/"].sample
    traded = [true, false].sample
    like_count = (0..20).to_a.sample

    u.posts.create!(
      title: title,
      description: description,
      category: category,
      image_url: url,
      traded: traded,
      like_count: like_count
    )
  end
end
