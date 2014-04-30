class WaterFountainImporter
  def self.process(csv_data, name)
    count = 0
    inserted = 0
    pretend_inserted = 0
    skipped_for_deletion = 0
    failed_to_insert = 0

    CSV.parse(csv_data, :headers => true) do |row|
      raise Error.new('missing lat lon') unless row["latlon"].present?

      lat, lon = row["latlon"].split(',')

      raise Error.new('missing source or source:key') unless row["source:pkey"].present? && row["source"].present?
      source_pkey = row["source:pkey"]
      source = row["source"]

      row_desc =  "<#{lat}> <#{lon}> <#{source}> <#{source_pkey}>"
      puts row_desc if ENV['PRINT_ROWS']

      # build up input fountain_params
      fountain_params = {location: {type: "Point", coordinates: [lon, lat]}}
      if source
        fountain_params[:data_source] = source
        fountain_params[:data_source_id] = source_pkey
      end

      fountain_params[:import_source] = name

      count += 1

      if row['deleted']
        skipped_for_deletion += 1
      elsif ENV['PRETEND']
        pretend_inserted += 1
        if pretend_inserted % 100 == 0
          print "."
          $stdout.flush
        end
      else
        fountain = WaterFountain.where(data_source: source, data_source_id: source_pkey).first_or_create(fountain_params)
        if fountain.persisted?
          inserted += 1
          if inserted % 100 == 0
            print "."
            $stdout.flush
          end
        else
          failed_to_insert += 1
          puts "error inserting row!"
          puts fountain.errors.full_messages
          puts row_desc if ENV['PRINT_ROWS']
        end
      end

    end
    puts "Processed #{count} lines of data"

    if ENV['PRETEND']
      puts "Would have inserted #{pretend_inserted} water fountains"
    else
      puts "Inserted #{inserted} water fountains"
    end
    puts "Skipped inserting  #{skipped_for_deletion} records because they were marked for deletion"
    puts "Failed to insert #{failed_to_insert} fountains due to validation error."

  end

end

