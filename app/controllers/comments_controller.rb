class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.blog_id = Blog.all.find_by_url(params[:blog_id]).id

    @comment.save

    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to blog_path(@comment.blog)
    else
      @blog = @comment.blog
      flash[:danger] = "Your comment was not posted because there were errors in the form. Please click on 'Post a comment' to view the errors and try again."
      render 'blogs/show'
    end
  end

  private
  
    def comment_params
      params.require(:comment).permit(:name, :email, :body)
    end
end
