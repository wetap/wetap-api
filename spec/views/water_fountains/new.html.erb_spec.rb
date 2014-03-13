require 'spec_helper'

describe "water_fountains/new" do
  before(:each) do
    assign(:water_fountain, stub_model(WaterFountain,
      :point => ""
    ).as_new_record)
  end

  it "renders new water_fountain form" do
    render

    assert_select "form[action=?][method=?]", water_fountains_path, "post" do
      assert_select "input#water_fountain_point[name=?]", "water_fountain[point]"
    end
  end
end
