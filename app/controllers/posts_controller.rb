class PostsController < ApplicationController
    
    def index
        @posts = Post.all.order(created_at: 'desc')
        render 'posts/index'
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def new
        
    end
    
end
