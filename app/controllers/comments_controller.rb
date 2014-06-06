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
      render 'blogs/show'
    end
  end

  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end
