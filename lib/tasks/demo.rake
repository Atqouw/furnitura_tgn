namespace :demo do
  desc 'Create Demo Data'
  task seed: :environment do

    puts '===================================Start Demo==================================='
    Rake::Task['users:create'].execute
    puts '===================================End Demo====================================='
  end
end