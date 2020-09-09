require 'bundler/setup'
require 'pry'
require 'active_record'
require 'require_all'
require_all('lib')

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'db/development.sqlite3'
)