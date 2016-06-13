class AddGroupNumberToLight < ActiveRecord::Migration
  def change
    add_column :lights, :group_number, :integer
  end
end
