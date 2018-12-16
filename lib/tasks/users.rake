namespace :users do

  desc 'Create Admin Users'
  task create: :environment do
    User.create!(
      [
        {
          email: 'admin@gmail.com',
          password: '123123',
          role: User.roles[:admin]
        },
        {
          email: 'member@gmail.com',
          password: '123123',
          role: User.roles[:member]
        }
      ]

    )
  end

end