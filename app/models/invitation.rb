# == Schema Information
#
# Table name: invitations
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  group_id     :integer
#  recipient_id :integer
#  sender_id    :integer
#
class Invitation < ApplicationRecord
  belongs_to(:sender, :required => true, :class_name => "User", :foreign_key => "sender_id")
  belongs_to(:recipient, :required => true, :class_name => "User", :foreign_key => "recipient_id")
  belongs_to(:group, :required => true, :class_name => "Group", :foreign_key => "group_id")


end
