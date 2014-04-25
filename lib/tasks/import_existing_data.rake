require 'open-uri'
require 'csv'

@data_path = Rails.root.join('tmp/data_import')

def ensure_directory(pth)
    FileUtils::mkdir_p(pth)
end

def download_data_and_read(name, attributes)
  cache_locally = ENV['CACHE']
  file_location = @data_path.join(name)
  puts "getting '#{name}'"
  if(cache_locally && File.exist?(file_location) )
    puts "    discovered local cache"
    attributes[:data] = File.read(file_location)
  else
    puts "    fetching from web"
    attributes[:data] = open(attributes[:url]).read
    if(cache_locally)
      attributes[:data].force_encoding('UTF-8')
      File.open(file_location, 'w') {|f| f.write(attributes[:data]) }
    end
  end
end

# Process different data sources
def process_mdcWetap2(csv_data)
  count = 0
  CSV.parse(csv_data, :headers => true) do |row|
    # TODO
    throw('missing lat lon') unless row["latlon"].present?
    lat, lon = row["latlon"].split(',')
    source = row["source"]
    puts [lat, lon, source] if ENV['PRINT_ROWS']
    count += 1
  end
  puts "Processed #{count} lines of data"
end

namespace :wetap do
  desc "Import existing wetap data from various sources"
  task import_existing_data: :environment do

    ensure_directory(@data_path);

    needed_files = {"mdcWetap2.csv" => {:url => 'https://s3.amazonaws.com/wetap-development-resources/mdcWeTap2.csv'}}
    needed_files.each do |name, attributes|
      download_data_and_read(name, attributes)
    end

    puts "Begin extracting data"
    puts "mdcWetap2: "
    process_mdcWetap2(needed_files["mdcWetap2.csv"][:data])

  end
end
