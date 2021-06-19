class PostsController < ApplicationController
    
    def index
        @posts = Post.all.order(created_at: 'desc')
        render 'posts/index'
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def create
        #render plain: "受信パラメター：#{params}"
        @post = Post.new(post_params)
        if @post.save
            # トップページ（→新規ブログの一覧に書いてあるページ）にリダイレクトする
            redirect_to posts_path
        else
            # セーブ中に問題が生じた場合は、ブログのホーム画面を表示する
            render "new"
        end
        
    end
    
    def new
        @post = Post.new
    end
    
    private def post_params
        params.require(:post).permit(:title, :body)
    end
    
end
