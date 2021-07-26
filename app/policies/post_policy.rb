class PostPolicy < ApplicationPolicy
    # サインインしていないときは認可で許可しない
    def create?   # ApplicationControllerでnew?はcreate?を参照
        user   # punditがcurrent_userを呼び出しuserを代入
    end
end