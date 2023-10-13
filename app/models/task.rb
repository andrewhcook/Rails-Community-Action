# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  group_id    :integer
#  leader_id   :integer
#
class Task < ApplicationRecord
  belongs_to(:leader, :required => true, :class_name => "User", :foreign_key => "leader_id")
  has_many(:user_on_tasks, :class_name => "UserOnTask", :foreign_key => "task_id", :dependent => :destroy)
  belongs_to(:group, :required => true, :class_name => "Group", :foreign_key => "group_id")
end
