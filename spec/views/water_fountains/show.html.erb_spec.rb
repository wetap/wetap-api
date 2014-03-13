require 'spec_helper'

describe "water_fountains/show" do
  before(:each) do
    @water_fountain = assign(:water_fountain, stub_model(WaterFountain,
      :point => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
