class StaticPagesController < ApplicationController
  def home
    @blogs = Blog.first(5)
  end

  def about
  end

  def portfolio
  end

  def resume
  end
end
