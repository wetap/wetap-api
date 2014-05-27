class DatabaseController < ApplicationController
  def reset
    if Rails.env.test?
      DatabaseCleaner.clean_with :truncation
      load 'db/seeds.rb'
      render text: "reset the database"
    else
      raise RuntimeError.new("tried to reset Database in non-test Environment")
    end
  end
end
