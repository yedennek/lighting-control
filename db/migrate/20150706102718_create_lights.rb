class CreateLights < ActiveRecord::Migration
  def change
    create_table :lights do |t|
      t.string :name
      t.boolean :on
      t.string :colour
    end
  end
end
