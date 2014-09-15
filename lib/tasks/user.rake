namespace :user do
  desc "Task to create the admin user.
        Call example: rake user:create_admin[password]"
  task :create_admin, [:service_name] => :environment do |t, args|
    if u = User.create(:email => "devteam@ideas4all.com", :password => args[:password], :password_confirmation => args[:password])
      p 'User created!!'
    else
      p u.errors.full_messages
    end
  end
end
