namespace :items do

  desc 'Create Demo Items'
  task create: :environment do
    20.times { create_item }
  end

  private

  def create_item
    is_sell_out = [true, false].sample
    item = Item.new(
      name: Faker::Coffee.origin,
      description: Faker::Coffee.notes,
      sale_price: [*300..1500].sample,
      categories_items_attributes: [ { category: Category.order("RANDOM()").last } ]
    )
    if is_sell_out
      item.discount_percent = [*1..60].sample
      item.is_sell_out = [true, false].sample
    end

    item.save!
  end

end