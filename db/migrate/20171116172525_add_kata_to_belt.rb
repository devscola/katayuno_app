class AddKataToBelt < ActiveRecord::Migration[5.1]
  def change
    add_column :belts, :kata, :integer
  end
end
