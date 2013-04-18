require 'rubygems'
require 'bundler/setup'
require 'daemons'

require './lib/configuration_reader'
require './lib/git_gateway'
require './lib/section'

INSTALL_DIR = File.expand_path(File.dirname(__FILE__))
Daemons.run('lib/runner.rb')
