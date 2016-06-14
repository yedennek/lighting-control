require 'milight'

class Light < ActiveRecord::Base
  def post_milight
    light_group = LightGroup.find_by light_controller_id
    controller = Milight::Controller.new light_group.ip_address

    if on
      controller.group(group_number).on
    else
      controller.group(group_number).off
    end
  end
end
