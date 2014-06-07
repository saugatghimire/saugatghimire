module BlogsHelper
  def blog_params
    params.require(:blog).permit(:title, :body, :tag_list)
  end
end
