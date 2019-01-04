namespace :demo do
  desc 'Create Demo Data'
  task seed: :environment do

    puts '===================================Start Demo==================================='
    Rake::Task['users:create'].execute
    Rake::Task['categories:create'].execute
    Rake::Task['items:create'].execute
    puts '===================================End Demo====================================='
  end
end