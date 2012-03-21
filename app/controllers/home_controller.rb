class HomeController < ApplicationController
  def main
    @puppies = Pet.puppies.last(3)
    @posts = Post.with_preview.order("RANDOM()").last(3)
  end
end
