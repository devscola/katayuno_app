class AddUserToExample < ActiveRecord::Migration[5.1]
  def change
    add_column :examples, :user, :integer
  end
end
