# == Schema Information
#
# Table name: user_in_groups
#
#  id         :integer          not null, primary key
#  admin      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  user_id    :integer
#
class UserInGroup < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id")
  belongs_to(:group, :required => true, :class_name => "Group", :foreign_key => "group_id")


end
