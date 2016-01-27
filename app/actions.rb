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
