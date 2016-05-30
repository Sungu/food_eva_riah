class PostController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:delete,:update]
  
  def show
    @post = Post.find(params[:id])
  end

  def new
  end
  
  def create
    post = Post.create(user_id: current_user.id, title: params[:title],img: params[:img], content: params[:content])
    redirect_to "/post/show/#{post.id}"
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    water = Post.find(params[:id])
    water.title = params[:title]
    water.img = params[:img]
    water.content = params[:content]
    if current_user.id == water.user_id
      water.save
    end
    redirect_to "/post/show/#{water.id}"
  end
  
  def delete
    post=Post.find(params[:id])
    if current_user.id == post.user_id
      post.destroy
    end
    redirect_to '/'
  end
end
