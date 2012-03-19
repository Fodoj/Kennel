class HomeController < ApplicationController
  def main
    @puppies = Pet.puppies.last(3)
    @posts = Post.last(3)
  end
end
