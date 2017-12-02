class AddImageToBelt < ActiveRecord::Migration[5.1]
  def change
    add_column :belts, :image, :string
  end
end
