# == Schema Information
#
# Table name: groups
#
#  id                :integer          not null, primary key
#  mission_statement :text
#  private           :boolean
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  creator_id        :integer
#
class Group < ApplicationRecord


  validates :title, :uniqueness => {:case_sensitive => false}
  validates :title, :presence => true
  validates :creator_id, :presence => true

  belongs_to(:creator, :required => true, :class_name => "User", :foreign_key => "creator_id")
  has_many(:tasks, :class_name => "Task", :foreign_key => "group_id", :dependent => :destroy)
  has_many(:user_in_groups, :class_name => "UserInGroup", :foreign_key => "group_id", :dependent => :destroy)
  has_many(:invitations, :class_name => "Invitation", :foreign_key => "group_id", :dependent => :destroy)
end
