helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :index
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/login' do
  erb :'/sessions/new'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect '/posts'
  end
end

get '/users' do
  @users = User.all
  redirect '/posts'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    redirect '/posts'
  else
    erb :'/users/new'
  end
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
    image_url:   params[:image_url],
    user: current_user
    )
end
