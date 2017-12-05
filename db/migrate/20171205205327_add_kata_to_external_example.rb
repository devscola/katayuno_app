class AddKataToExternalExample < ActiveRecord::Migration[5.1]
  def change
    add_column :external_examples, :kata, :integer
  end
end
