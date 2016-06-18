class ConfigurationController < ApplicationController

  def index
  end

  def upload
    uploaded_io = params[:config_file]
    config_json = JSON.parse uploaded_io.read
    create_lights config_json
    redirect_to root_path
  end
  
  private

  def create_lights config
    drop_existing_config
    controllers = config['controllers']
    controllers.each do |controller|
      light_group = LightGroup.create(ip_address: controller['ip'], name: controller['name'])
      controller['groups'].each do |light|
        Light.create(name: light['name'], group_number: light['number'], light_controller_id: light_group, colour: 'ffffff')
      end
    end
  end

  def drop_existing_config
    LightGroup.destroy_all
    Light.destroy_all
  end
end
