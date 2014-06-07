class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by_name(params[:id])
  end

  def destroy
    @tag = Tag.find_by_name(params[:id])
    @tag.destroy

    flash[:warning] = "Tag '#{@tag.name}' Deleted!"

    redirect_to tags_path
  end
end
