class HomeController < ApplicationController
  def main
    @puppies = Pet.puppies.last(3)
    @posts = Post.with_preview.order("RANDOM()").last(3)
    @photos = Photo.main.order("RANDOM()").last(7)
  end
end
