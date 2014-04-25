require 'open-uri'
require 'csv'

def ensure_directory(pth)
    FileUtils::mkdir_p(pth)
end

def download_data_and_read(name, attributes)
  puts "fetching #{attributes[:url]}"
  attributes[:data] = open(attributes[:url]).read
end

# Process different data sources
def process_mdcWetap2(csv_data)
  count = 0
  CSV.parse(csv_data) do |row|
    # TODO
    count += 1
  end
  puts "Processed #{count} lines of data"
end

namespace :wetap do
  desc "Import existing wetap data from various sources"
  task import_existing_data: :environment do
    data_path = Rails.root.join('tmp/data_import')

    ensure_directory(data_path);

    needed_files = {"mdcWetap2.csv" => {:url => 'https://s3.amazonaws.com/wetap-development-resources/mdcWeTap2.csv'}}
    needed_files.each do |name, attributes|
      download_data_and_read(name, attributes)
    end

    puts "Begin extracting data"
    puts "mdcWetap2: "
    process_mdcWetap2(needed_files["mdcWetap2.csv"][:data])

  end
end
