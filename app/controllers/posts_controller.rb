class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
	end

  def create
    @post = Post.new(post_params)
      if @post.save
        flash[:notice] = "Blog post created successfully!"
        redirect_to posts_path(@post)
      else
        flash[:alert] = "There was a problem.  Please try again."
        redirect_to '/'
      end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private 
    def post_params
      params.require(:post).permit(:title, :author, :title)
    end
end

