require 'spec_helper'

describe "water_fountains/edit" do
  before(:each) do
    @water_fountain = assign(:water_fountain, stub_model(WaterFountain,
      :point => ""
    ))
  end

  it "renders the edit water_fountain form" do
    render

    assert_select "form[action=?][method=?]", water_fountain_path(@water_fountain), "post" do
      assert_select "input#water_fountain_point[name=?]", "water_fountain[point]"
    end
  end
end
