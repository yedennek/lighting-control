class AddLightControllerToLights < ActiveRecord::Migration
  def change
    add_reference :lights, :light_controller, index: true, foreign_key: true
  end
end
