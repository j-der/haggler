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

User.all.each do |u|
  5.times do
    title = Faker::Commerce.product_name
    description = Faker::Lorem.paragraph(8, true)
    category = ["goods", "services"].sample
    url = Faker::Internet.url
    u.posts.create!(
      title: title,
      description: description,
      category: category,
      image_url: url
    )
  end
  # binding.pry
end
