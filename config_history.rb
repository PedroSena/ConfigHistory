require 'rubygems'
require 'bundler/setup'
require 'daemons'

ROOT_DIR = File.dirname(__FILE__)
Dir[ROOT_DIR + "src/**/*.rb"].each {|f| require f}
Daemons.run('src/runner.rb')
