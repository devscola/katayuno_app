class CreateBelts < ActiveRecord::Migration[5.1]
  def change
    create_table :belts do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
