# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Post < ApplicationRecord
    belongs_to :user   # 一つのポストは必ず一人のユーザを持つ
    has_many :comments, dependent: :destroy
    # タイトル:空文字禁止、最低３文字以上
    validates :title, presence: true, length: {minimum: 3}
    # body :空文字禁止
    validates :body, presence: true
end
