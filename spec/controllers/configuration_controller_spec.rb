require 'rails_helper'

describe ConfigurationController do

  describe "#configuration" do
    it "displays configuration template" do
      get :index
      expect(response).to render_template :index
    end
  end

end
