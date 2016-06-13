class ConfigurationController < ApplicationController

  def index
  end

  def upload
    uploaded_io = params[:config_file]
    config_json = JSON.parse uploaded_io.read
    create_lights config_json
    render :index
  end
  
  private

  def create_lights config
    controllers = config['controllers']
    controllers.each do |controller|
      light_controller = LightGroup.create(ip_address: controller['ip'], name: controller['name'])
      controller['groups'].each do |light|
        Light.create(name: light['name'], group_number: light['number'], light_controller_id: light_controller.id)
      end
    end
  end
end
