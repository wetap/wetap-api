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

    name = "mdcWetap2.csv"
    data = download_data_and_read(name, 'https://s3.amazonaws.com/wetap-development-resources/mdcWeTap2-with_source_ids.csv')
    puts "Begin extracting data"
    puts "mdcWetap2: "
    WaterFountainImporter.process(data, name)

  end

  desc "annotate blank sources in input file"
  task ensure_source_id: :environment do
    next_available_id = 0
    name = 'mdcWetap2.csv'
    data = download_data_and_read(name, 'https://s3.amazonaws.com/wetap-development-resources/mdcWeTap2.csv')

    outfile = CSV.open("tmp/data_import/mdcWeTap2-with_source_ids.csv", "wb")

    csv_headers = CSV.parse(data)[0]
    outfile << csv_headers

    CSV.parse(data, :headers => true) do |row|
      if row["source"] == nil || row["source"].empty?
        row["source"] = name
        row["source:pkey"] = next_available_id
        next_available_id += 1
      end
      outfile << row
    end

    outfile.close
  end

end
