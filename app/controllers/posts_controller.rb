require 'open-uri'

class PostsController < ApplicationController
  def index
    # This will expire every hour or so. You'll have to get a new one from the Graph API explorer.
    my_access_token = "AAACEdEose0cBALndLfu2JorbdzbOx5xNIaZAfEFqkb4LkZCqGCkuzhBgRYKebW4EkLrd6h8Bsx5uUQlsbzKEMft8GTryfaGzqtnljGswZDZD"
    
    url = "https://graph.facebook.com/me/home?access_token=#{my_access_token}&limit=200"
    
    response = open(url).read
    
    json_response = JSON.parse(response)
    
    @posts = json_response["data"]
    
    @posts_with_videos = @posts.select { |post| post["type"] == "video" && post["link"].present? }
  end
end