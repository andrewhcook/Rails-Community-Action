class GroupPolicy
  attr_reader :user, :group

  def initialize(user, group)
    @user = user
    @group = group
  end

  def show?
    if !@user.nil?
      if user_in_group?
        return true
      end
    end

    if Group.find(@group.id).private == false
      return true
    end
  end

  def user_signed_in?
    if !user.nil?
      return true
    else
      return false
    end
  end
  
  def user_is_creator?
    if Group.find(@group.id).creator_id == @user.id
      return true
    else
      return false
    end
  end

  private

  def user_in_group?
    return  !UserInGroup.find_by(:group_id => @group.id, :user_id => @user.id).nil?
      
  end

end
