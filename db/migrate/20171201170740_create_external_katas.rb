class CreateExternalKatas < ActiveRecord::Migration[5.1]
  def change
    create_table :external_katas do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
