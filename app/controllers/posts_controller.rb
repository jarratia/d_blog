class PostsController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only: :dashboard
  
  def index
     @posts = Post.order(id: :desc)
  end

  def dashboard
  end

  def create
    @posts = Post.create(title: params[:title], 
                        link: params[:link], 
                        content: params[:content])

    if @posts.content.include?("spoiler")
      @posts.content.slice!("spoiler")
    end

    @posts.save

  end

end 
