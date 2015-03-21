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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post was successfully updated!"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post was successfully annihilated."
    redirect_to posts_path
  end

  private 
    def post_params
      params.require(:post).permit(:title, :author, :body)
    end
end

