require 'spec_helper'

describe WaterFountain do
  let(:water_fountain) { WaterFountain.new }

  describe "location" do
    subject { water_fountain.location }

    context "when no location is set" do
      before do
        water_fountain[:location] = nil
      end
      it { should be_nil }
    end

    context "when a bogus location was set" do
      before do
        water_fountain[:location] = ""
      end
      it { should be_nil }
    end

    context "when WKT location is set" do
      before do
        water_fountain[:location] = "POINT(1.0 1.0)"
      end
      it { should == {"type"=>"Point", "coordinates"=>[1.0, 1.0]}}
    end
  end

  describe "location=" do
    before do
      water_fountain.location= value
    end
    subject { water_fountain.location }

    context "when setting a valid value" do
      let(:value) { {"type"=>"Point", "coordinates"=>[1.0, 1.0]}}
      it { should == value }
    end

    context "when setting an invalid value" do
      let(:value) { "bogus value" }
      it { should == nil }
    end

    context "when setting to nil" do
      let(:value) { nil }
      it { should == nil }
    end
  end
end
