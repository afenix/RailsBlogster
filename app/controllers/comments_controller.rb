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
      respond_to do |format| 
        format.html { redirect_to post_path(@comment.post) }
        format.js
      end
    else 
      flash[:alert] = "Something has gone awry. Try again!"
      redirect_to :back
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update 
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if @comment.update(comment_params)
      flash[:notice] = "Your comment has been edited."
      respond_to do |format| 
        format.html { redirect_to post_path(@comment.post) }
        format.js
      end
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
    redirect_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

private
  def comment_params
    params.require(:comment).permit(:body, :author)
  end
end
