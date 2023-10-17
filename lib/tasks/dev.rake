require "faker"
desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  if Rails.env.development?
    Invitation.destroy_all
    UserOnTask.destroy_all
    UserInGroup.destroy_all
    Task.destroy_all
    Group.destroy_all
    User.destroy_all
  end

  ## create users
  ## create groups

  25.times do
    user = User.new
    name = Faker::Name.first_name
    user.email = "#{name}@example.com"
    user.password = "password"
    user.inspirational_quote = Faker::Quotes::Shakespeare.romeo_and_juliet_quote
    user.username = "#{name}"
    user.save

    group = Group.new
    group.title = "#{Faker::Fantasy::Tolkien.character}s"
    group.creator_id = user.id
    group.private = false
    if group.creator_id % 2 == 0
      group.private = true
    end
    group.mission_statement = Faker::Quotes::Shakespeare.hamlet_quote
    group.save
  end

  ## add users to groups
  groups = Group.all
  users = User.all

  groups.each do |group|
    users.each do |user|
      if rand > 0.50
        user_in_group = UserInGroup.new
        user_in_group.user_id = user.id
        user_in_group.group_id = group.id
        user_in_group.save
      end
    end
  end

  ## create tasks
  ##iterate over groups
  ##add 5 tasks
  ## add 3 users to each task

  groups.each do |group|
    5.times do
      users_on_task = UserInGroup.where(:group_id => group.id).all

      task = Task.new
      task.name = Faker::Markdown.emphasis
      task.group_id = group.id
      task.leader_id = users_on_task.sample.user_id
      task.description = Faker::Markdown.emphasis
      task.save
      3.times do
        user = User.where( :id => users_on_task.sample.user_id).first
        user_on_task = UserOnTask.new
        user_on_task.group_id = group.id
        user_on_task.user_id = user.id
        user_on_task.task_id = task.id
        user_on_task.save
      end
    end
  end

  ## create invitations at randomness threshold
    ## !unimplemented
end
