helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :index
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/login' do
  erb :'/sessions/new'
end

post '/login' do
  session[:bad_user] = false 
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/posts'
  else 
    session[:bad_user] = true 
    redirect '/login'
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
  if current_user
    erb :'posts/new'
  else 
    redirect '/login'
  end
end

post '/posts' do
  if current_user
    @post = Post.new(
      title:       params[:title],
      description: params[:description],
      category:    params[:category],
      image_url:   params[:image_url],
      user_id: current_user.id
      )
    if @post.save
      redirect '/posts'
    else
      erb :'posts/new'
    end
  else
    redirect '/login'
  end
end


