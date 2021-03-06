require_relative('helpers/helpers.rb')

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
  if @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    session[:user_id] = @user.id
    redirect '/posts'
  else
    session[:bad_user] = true
    redirect '/login'
  end
end

get '/posts/map' do
  @post = Post.where(traded: false)
  erb :'posts/map'
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
    username: params[:username],
    password: params[:password],
    address: params[:address]

  )
  if @user.save
    session[:user_id] = @user.id
    redirect '/posts'
  else
    erb :'/users/new'
  end
end

get '/posts' do
  session[:offset] = 0
  @posts = Post.all.limit(10).order(created_at: :desc).order(like_count: :desc)
  erb :'posts/index'
end

get '/posts/older' do 
  session[:offset] += 10 
  @posts = Post.all.limit(10).offset(session[:offset]).order(like_count: :desc).order(created_at: :desc)
  erb :'posts/index'
end

get '/posts/newer' do 
  session[:offset] -= 10
  @posts = Post.all.limit(10).offset(session[:offset]).order(like_count: :desc).order(created_at: :desc)
  erb :'posts/index'
end

get '/posts/new' do
  if current_user
    erb :'posts/new'
  else
    redirect '/login'
  end
end

get '/posts/traded' do
  @posts = Post.where(traded: true)
  erb :'posts/index'
end

get '/posts/available' do
  @posts = Post.where(traded: false)
  erb :'posts/index'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'posts/show'
end

post '/posts' do
  if current_user
    @post = Post.new(
      title:       params[:title],
      description: params[:description],
      category:    params[:category],
      image_url:   params[:image_url],
      latitude:    params[:latitude],
      longitude:   params[:longitude],
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

get '/posts/category/:category' do
  @posts = Post.where(category: params[:category])
  erb :'posts/index'
end

post '/posts/category' do
  # filter_by_category(category)
  @posts = Post.where(category: params[:category])
  erb :'posts/index'
end

post '/posts/delete/:id' do
  if current_user
    @post = Post.find(params[:id])
    if current_user.email == @post.user.email
      @post.destroy
      redirect '/posts'
    else
      redirect '/'
    end
  end
end

post '/like' do 
  if current_user
    @like = Like.new(
      user_id: current_user.id, 
      post_id: params[:post_id]
    )
    if @like.save
      redirect '/posts'
    else 
      redirect '/posts'
    end 
  else 
    redirect '/posts'
  end
end 

post '/posts/traded/:id' do
  @post = Post.find(params[:id])
  @post.traded = true
  @post.save
  redirect '/posts'
end
