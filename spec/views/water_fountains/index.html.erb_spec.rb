require 'spec_helper'

describe "water_fountains/index" do
  before(:each) do
    assign(:water_fountains, [
      stub_model(WaterFountain,
        :point => ""
      ),
      stub_model(WaterFountain,
        :point => ""
      )
    ])
  end

  it "renders a list of water_fountains" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
