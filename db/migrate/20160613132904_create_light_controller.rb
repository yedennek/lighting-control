class CreateLightController < ActiveRecord::Migration
  def change
    create_table :light_controllers do |t|
      t.string :ip_address
      t.string :name
    end
  end
end
