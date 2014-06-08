class TagsController < ApplicationController
  before_action :signed_in_user, except: [:index, :show]
  
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

  private

    def signed_in_user
      unless signed_in?
        flash[:warning] = "Please sign in!"
        redirect_to signin_url
      end
    end
end
