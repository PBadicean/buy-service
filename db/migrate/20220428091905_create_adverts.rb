class CreateAdverts < ActiveRecord::Migration[6.1]
  def change
    create_table :adverts do |t|
      t.text :article, null: false
      t.string :title, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
