class CreateExamples < ActiveRecord::Migration[5.1]
  def change
    create_table :examples do |t|
      t.string :text
      t.string :url
      t.integer :kata

      t.timestamps
    end
  end
end
