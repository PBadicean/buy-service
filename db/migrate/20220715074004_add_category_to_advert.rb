class AddCategoryToAdvert < ActiveRecord::Migration[6.1]
  def change
    add_column :adverts, :category_id, :integer, null: false
  end
end
