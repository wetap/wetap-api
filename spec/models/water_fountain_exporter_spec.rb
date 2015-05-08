require 'spec_helper'
require 'csv'

describe WaterFountainExporter do
  let(:water_fountain_exporter) { WaterFountainExporter.new(water_fountains) }
  describe '#csv' do
    subject { CSV.parse(water_fountain_exporter.csv) }
    context 'with no fountains' do
      let(:water_fountains) { [] }
      it { expect(subject).to eq([]) }
    end
    context 'with some fountains' do
      let(:water_fountain_1) { FactoryGirl.build(:water_fountain) }
      let(:water_fountain_2) { FactoryGirl.build(:water_fountain) }
      let(:water_fountains) { [water_fountain_1, water_fountain_2] }
      it 'writes proper csv' do
        expect(subject.length).to eq(2)
        expect(subject[0]).to eq({
          'id' => 2,
          'lon' => 11.11,
          'lat' => 22.22,
          'image_url' => 'www.images.com/my-image-1.jpg',
          'created_at' => '2015-01-01',
          'user_id' => 2,
          'working' => true,
          'filling_station' => false,
          'dog_bowl' => true,
          'flow' => 'good'
        })
      end
    end
  end
end
