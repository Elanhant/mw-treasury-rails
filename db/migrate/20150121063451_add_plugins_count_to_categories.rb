class AddPluginsCountToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :plugins_count, :integer, default: 0

    Category.all.each do |unit|
      Category.reset_counters(unit.id, :plugins)
    end
  end
end
