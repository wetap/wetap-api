# config/unicorn.rb
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout ENV["WEB_TIMEOUT"] || 60
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  if defined?(ActiveRecord::Base)
    config = Rails.application.config.database_configuration[Rails.env]
    config['adapter'] = 'postgis'

    if url = config.delete('url')
      # we take all params from the URL except the adapter
      # there is no safe way to specify a postgis adapter
      parsed_url = URI.parse(url)
      config_from_url =  { 
        'host' => parsed_url.host,
        'encoding' => 'unicode',
        'database' => parsed_url.path.split("/")[-1],
        'port' => parsed_url.port,
        'username' => parsed_url.user,
        'password' => parsed_url.password,
      }
      config.merge!(config_from_url)
    end

    ActiveRecord::Base.establish_connection(config)
  end
end
