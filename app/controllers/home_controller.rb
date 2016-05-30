class HomeController < ApplicationController
  def index
    @posts = Post.all
    @banner = @posts.sample
  end
end
