# == Schema Information
#
# Table name: user_on_tasks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  task_id    :integer
#  user_id    :integer
#
class UserOnTask < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id")
  belongs_to(:task, :required => true, :class_name => "Task", :foreign_key => "task_id")
  belongs_to(:group, :required => true, :class_name => "Group", :foreign_key => "group_id")
end
