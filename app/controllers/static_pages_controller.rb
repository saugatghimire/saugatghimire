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

  def grade_calculator
    render "static_pages/projects/grade_calculator.html.erb"
  end
end
