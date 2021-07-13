# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  signin_name     :string
#  display_name    :string
#  password_digest :string
#  status          :string           default("available")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
end
