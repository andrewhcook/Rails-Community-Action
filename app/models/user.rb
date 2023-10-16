# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  avatar_url             :string
#  bio                    :text
#  contact_info           :string
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  inspirational_quote    :text
#  password               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many(:groups, :class_name => "Group", :foreign_key => "creator_id", :dependent => :destroy)
  has_many(:user_on_tasks, :class_name => "UserOnTask", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:tasks, :class_name => "Task", :foreign_key => "leader_id", :dependent => :destroy)
  has_many(:user_in_groups, :class_name => "UserInGroup", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:sent_invitations, :class_name => "Invitation", :foreign_key => "sender_id", :dependent => :destroy)
  has_many(:received_invitations, :class_name => "Invitation", :foreign_key => "recipient_id", :dependent => :destroy)

  
end
