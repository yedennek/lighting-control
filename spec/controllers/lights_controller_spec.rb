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
    let(:light_json) { {id: 1, name: "Office", on: true, colour: "ffffff", group_number: 1} }

    before do
      @light = Light.create(name: "Office", on: false, colour: "ffffff", group_number: 1)
    end

    after do
      @light.destroy
    end

    it "returns json of current light state" do
      expected_json = {id: 1, name: "Office", on: true, colour: "ffffff", light_controller_id: nil, group_number: 1 }.to_json
      put :update, light_json
      expect(response.status).to eq 200
      expect(response.body).to eq expected_json
    end
  end
end
