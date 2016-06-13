require 'rails_helper'

describe ConfigurationController do

  describe "#configuration" do
    it "displays configuration template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "#upload" do
    before :each do
      @file = fixture_file_upload('config.json', 'text/json')
    end

    it "can upload a configuration file" do
      post :upload, :config_file => @file
      expect(response.status).to eq(200)
    end

    it "displays configuration template" do
      post :upload, :config_file => @file
      expect(response).to render_template :index
    end

    it "creates lights and lighting groups" do
      post :upload, :config_file => @file
      expect(Light.all.size).to eq 5
      expect(LightGroup.all.size).to eq 2
    end

    context "where there's existing config" do
      before do
        light_controller = LightGroup.create(ip_address: '0.0.0.0', name: 'house')
        Light.create(name: 'Lounge', group_number: 3, light_controller_id: light_controller.id)
      end

      it "removes existing lights and lighting groups" do
        post :upload, :config_file => @file
        expect(Light.all.size).to eq 5
        expect(LightGroup.all.size).to eq 2
      end
    end
  end
end
