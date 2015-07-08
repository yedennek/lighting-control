class LightsController < ApplicationController
  respond_to :json

  def index
    @lights = Light.all
  end

  def update
    light = Light.find_by(id: params[:id])
    light.update(on: params[:on])
    render status: 200, json: light.to_json
  end
end
