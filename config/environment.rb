require 'bundler/setup'
require 'pry'
require_all 'lib'
# require 

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'db/development.sqlite3'
)