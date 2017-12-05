class AddUserToExternalExamples < ActiveRecord::Migration[5.1]
  def change
    add_column :external_examples, :user, :integer
  end
end
