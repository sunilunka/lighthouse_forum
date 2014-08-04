class PostsController < ApplicationController


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title: params[:post][:title],
      author: params[:post][:author],
      text: params[:post][:text]
    )

    if @post.save 
      redirect_to posts_path
    else
      render :new
    end
    
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  protected 

  def post_params
    params.require(:post).permit(:title, :author, :text)
  end



end