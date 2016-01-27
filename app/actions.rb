# Homepage (Root path)
get '/' do
  erb :index
end

get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

get '/posts/new' do
  erb :'posts/new'
end

post 'posts' do
  @post = Post.new(
    title:       params[:title],
    description: params[:description],
    image_url:   params[:image_url]
    user: #current_user?
    )
end
