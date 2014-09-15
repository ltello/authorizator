namespace :user do
  desc "Task to create the admin user.
        Call example: rake user:create_admin[password]"
  task :create_admin, [:password] => :environment do |t, args|
    admin = User.create(:email => "devteam@ideas4all.com", :password => args[:password], :password_confirmation => args[:password])
    if admin.valid?
      p 'User created!!'
    else
      p admin.errors.full_messages
    end
  end
end
