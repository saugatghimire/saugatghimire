class BlogsController < ApplicationController
  include BlogsHelper

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by_url(params[:id])
    @comment = Comment.new
    @comment.blog_id = @blog.id
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    
    if @blog.save
      flash[:success] = "Blog '#{@blog.title}' Created!"
      redirect_to blog_path(@blog)
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find_by_url(params[:id])
  end

  def update
    @blog = Blog.find_by_url(params[:id])
    
    if @blog.update(blog_params)
      flash[:success] = "Blog '#{@blog.title}' Updated!"
      redirect_to blog_path(@blog)
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find_by_url(params[:id])
    @blog.destroy

    flash[:warning] = "Blog '#{@blog.title}' Deleted!"

    redirect_to blogs_path
  end
end
