class UserPolicy
  attr_reader :user

  def initialize(user)
    @user = user 
  end

  def show?
    false
  end

end
