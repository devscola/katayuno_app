class AddExternalIdToExternalKata < ActiveRecord::Migration[5.1]
  def change
    add_column :external_katas, :external_id, :string
  end
end
