# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  avatar_url          :string
#  bio                 :text
#  contact_info        :string
#  email               :string
#  inspirational_quote :text
#  password            :string
#  username            :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class User < ApplicationRecord
  has_many(:groups, :class_name => "Group", :foreign_key => "creator_id", :dependent => :destroy)
  has_many(:user_on_tasks, :class_name => "UserOnTask", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:tasks, :class_name => "Task", :foreign_key => "leader_id", :dependent => :destroy)
  has_many(:user_in_groups, :class_name => "UserInGroup", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:sent_invitations, :class_name => "Invitation", :foreign_key => "sender_id", :dependent => :destroy)
  has_many(:received_invitations, :class_name => "Invitation", :foreign_key => "recipient_id", :dependent => :destroy)

  
end
