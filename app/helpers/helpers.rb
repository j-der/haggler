helpers do

  def filter_by_category(category)
  	@posts = Post.where(category:params[:category])
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

end