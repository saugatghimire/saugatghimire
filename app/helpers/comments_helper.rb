module CommentsHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(comment)
    gravatar_id = Digest::MD5::hexdigest(comment.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=retro"
    image_tag(gravatar_url, size: "60", alt: comment.name, class: "gravatar")
  end
end
