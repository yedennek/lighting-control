require 'rails_helper'

describe Light do
  describe "#post_milight" do
    let(:milight_controller) { double :milight_controller }
    let(:group) { double :group }

    before do
      expect(Milight::Controller).to receive(:new).with('1.1.1.1').and_return milight_controller
      expect(milight_controller).to receive(:group).with(1).and_return group
      expect(group).to receive(:on)
    end

    it "posts current light state to Milight controller" do
      light_group = LightGroup.create(name: 'downstairs', ip_address: '1.1.1.1' )
      light = Light.create(name: 'lounge', on: true, group_number: 1, colour: '#ffffff', light_controller_id: light_group.id)
      light.post_milight
    end
  end
end
