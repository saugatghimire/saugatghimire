module BlogsHelper
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
