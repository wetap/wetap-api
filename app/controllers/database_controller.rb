class DatabaseController < ApplicationController
  def reset
    if Rails.env.test?
      DatabaseCleaner.clean_with :truncation
      load 'db/seeds.rb'
      render text: "reset the database"
    end
  end
end
