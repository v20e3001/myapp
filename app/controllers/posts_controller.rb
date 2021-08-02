class PostsController < ApplicationController
    
    def index
        @posts = Post.all.order(created_at: 'desc')
        render 'posts/index'
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def create
        # サインインしているユーザのidでブログの新規登録を行う
        @post = Post.new(post_params.merge({user_id: session[:user_id]}))
        authorize @post
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
        authorize @post
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    # 既存の記事を編集する
    def update
        @post = Post.find(params[:id])
        # 編集した内容をサーバーに送り返す
        if @post.update(post_params)
            redirect_to posts_path
        else
            # 更新に失敗したら編集画面に戻る
            render "edit"
        end
    end
    
    # 注目しているレコードのIDがユーザIDと等しいか
    # 等しい場合はupdateが実行される
    def update?
        record.user_id == user_id
    end
    
    private def post_params
        params.require(:post).permit(:title, :body)
    end
    
end
