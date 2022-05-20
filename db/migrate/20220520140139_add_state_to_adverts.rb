class AddStateToAdverts < ActiveRecord::Migration[6.1]
  def self.up
    add_column :adverts, :aasm_state, :string
  end

  def self.down
    remove_column :adverts, :aasm_state
  end
end
