require 'rails_helper'
describe LightsController do
  describe "GET index" do
    it "renders index" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns lights" do
      get :index
      expect(assigns(:lights)).to eq Light.all
    end
  end

  describe "PUT update" do
    let(:light) { spy :light, to_json: @expected_json }
    let(:light_json) { {id: 1, name: "Office", on: true, colour: "ffffff", group_number: 1} }

    before do
      @expected_json = {id: 1, name: "Office", on: true, colour: "ffffff", light_controller_id: 3, group_number: 1 }.to_json
      allow(Light).to receive(:find_by).with(id: "1").and_return light
    end

    it "returns json of current light state" do
      put :update, light_json
      expect(response.status).to eq 200
      expect(response.body).to eq @expected_json
    end

    it "calls milight controller to update light state" do
      put :update, light_json
      expect(light).to have_received(:post_milight)
    end
  end
end
