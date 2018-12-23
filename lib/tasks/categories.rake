namespace :categories do

  desc 'Create Categories'
  task create: :environment do
    Category.create!(
        [
            {
                name: 'Кухни',
                code: 'kitchens'
            },
            {
                name: 'Тумбочки',
                code: 'nightstands'
            },
            {
                name: 'Шкафы',
                code: 'cabinets'
            },
            {
                name: 'Диваны',
                code: 'sofas'
            },
            {
                name: 'Стулья',
                code: 'chairs'
            },
            {
                name: 'Столы',
                code: 'tables'
            },
        ]

    )
  end

end