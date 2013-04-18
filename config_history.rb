require 'rubygems'
require 'bundler/setup'
require 'daemons'

require_relative './lib/configuration_reader'
require_relative './lib/git_gateway'
require_relative './lib/section'

INSTALL_DIR = File.expand_path(File.dirname(__FILE__))
Daemons.run( INSTALL_DIR + '/lib/runner.rb', dir: '/tmp', dir_mode: :normal, ontop: false, log_output: true)