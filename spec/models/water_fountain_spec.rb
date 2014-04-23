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

  describe ".bounded_by" do
    let!(:f1) { WaterFountain.create({:location => {"type"=>"Point", "coordinates"=>[1.0, 1.0]}})}
    let!(:f2) { WaterFountain.create({:location => {"type"=>"Point", "coordinates"=>[2.0, 2.0]}})}
    let!(:f3) { WaterFountain.create({:location => {"type"=>"Point", "coordinates"=>[3.0, 3.0]}})}
    let!(:f4) { WaterFountain.create({:location => {"type"=>"Point", "coordinates"=>[4.0, 4.0]}})}
    let!(:f5) { WaterFountain.create({:location => {"type"=>"Point", "coordinates"=>[5.0, 5.0]}})}

    let(:bounding_params){ [2,2,4,4] }
    subject { WaterFountain.bounded_by(bounding_params) }

    it { should include(f2, f3, f4) }
    it { should_not include(f1, f5) }

    context "a bounding box that croses the dateline" do
      let!(:f6) { WaterFountain.create({:location => {"type"=>"Point", "coordinates"=>[180, 0]}})}
      let!(:f7) { WaterFountain.create({:location => {"type"=>"Point", "coordinates"=>[-180, 0]}})}
      let!(:f8) { WaterFountain.create({:location => {"type"=>"Point", "coordinates"=>[0, 0]}})}
      # postgis ST_* operations are not defined over polygons of zero area
      let(:bounding_params){ [ 180.1, -0.1, -180, +0.1]}
      it { should include(f6, f7) }
      it { should_not include(f8) }
    end
  end

  describe ".bbox_crosses_dateline" do

    subject{ WaterFountain.bbox_crosses_dateline(bbox_params) }

    context "when bounding a non spanning region" do
      let(:bbox_params){ [-1, -1, 1, 1] }
      it{ should be_falsey }
    end
    context "when bounding a dateline spanning region" do
      let(:bbox_params){ [180, 0, -180, 1] }
      it{ should be_truthy }
    end
  end
end
