require 'rspec'
require 'pg'
require 'artist'
require 'festival'
require 'pry'

DB = PG.connect({:dbname => 'forest_festival_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM artists *;")
    DB.exec("DELETE FROM stages *;")
  end
end
