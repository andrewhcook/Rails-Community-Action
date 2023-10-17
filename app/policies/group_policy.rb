class GroupPolicy
  attr_reader :user, :group
  def initialize(user, group)
    @user = user
    @group = group
  end

  def show?
    if user_in_group? || Group.find(@group.id).private == false
      return true
    end
  end


  private

  def user_in_group?
     
    if !UserInGroup.find_by(:group_id=> @group.id, :user_id => @user.id).nil? 
      return true
  end
end
end
