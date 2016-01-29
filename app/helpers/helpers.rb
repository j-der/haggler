helpers do

  def filter_by_category(category)
  	@posts = Post.where(category:params[:category])
  end

end