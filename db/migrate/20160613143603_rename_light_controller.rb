class RenameLightController < ActiveRecord::Migration
  def change
    rename_table :light_controllers, :light_groups
  end
end
