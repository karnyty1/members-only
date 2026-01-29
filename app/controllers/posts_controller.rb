class  PostsController < ApplicationController
	before_action :require_login, only: [:new, :create]
  def index
    @posts = Post.all
  end


  def new
    @post = Post.new
  end

  
  def create
    @post = current_user.posts.build(post_params)

   
    if @post.save
      redirect_to posts_path, notice: "Post created"
    else
      render :new 
    end
  end





private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end

