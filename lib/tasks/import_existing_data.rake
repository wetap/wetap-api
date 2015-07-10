require 'open-uri'
require 'csv'
require 'water_fountain_importer'

@data_path = Rails.root.join('tmp/data_import')

def ensure_directory(path)
  FileUtils::mkdir_p(path)
end

def download_data_and_read(name, url)
  cache_locally = ENV['CACHE']
  file_location = @data_path.join(name)
  puts "getting '#{name}'"
  if(cache_locally && File.exist?(file_location) )
    puts "    discovered local cache"
    data = File.read(file_location)
  else
    puts "    fetching from web"
    data = open(url).read
    if(cache_locally)
      data.force_encoding('UTF-8')
      File.open(file_location, 'w') {|f| f.write(data) }
    end
  end
  data
end

namespace :wetap do
  desc "Import existing wetap data from various sources"
  task import_existing_data: :environment do
    ensure_directory(@data_path)

    name = "osm_fountains_2015-05-05.csv"
    data = download_data_and_read(name, 'https://s3.amazonaws.com/wetap-development-resources/osm_fountains_2015-05-05.csv')
    puts "Begin extracting data"
    puts "osm_fountains_2015-05-05.csv: "
    WaterFountainImporter.process(data, name)

  end

end
