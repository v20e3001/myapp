class SessionsController < ApplicationController
    
    def create
        user = User.find_by(signin_name: params[:signin][:signin_name])
        
        # ユーザーがレコードに存在していた場合は認証の確認を行った場合は
        # セッションを開始する
        if user && user.authenticate(params[:signin][:password])
            session[:user_id] = user.id.to_s
        end
        
        # ブログのトップに戻る
        redirect_to posts_path
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to posts_path
    end
end