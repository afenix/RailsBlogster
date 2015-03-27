class CommentsController < ApplicationController

  def new
   @post = Post.find(params[:post_id])
   @comment = @post.comments.new
  end

  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been added."
       redirect_to post_path(@comment.post)
    else 
      flash[:alert] = "Something has gone awry. Try again!"
      redirect_to :back
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update 
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Your comment has been edited."
      redirect_to post_path
    else
      flash[:alert] = "There was a problem."
      redirect_to :back
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment was successfully deleted."
    redirect_to :back
  end

private
  def comment_params
    params.require(:comment).permit(:body, :author)
  end
end
