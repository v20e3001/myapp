class PostPolicy < ApplicationPolicy
    # サインインしていないときは認可で許可しない
    def create?   # ApplicationControllerでnew?はcreate?を参照
        user   # punditがcurrent_userを呼び出しuserを代入
    end
    
    # 既存の記事を削除する
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end
    
    def destroy?
        update?
    end
end