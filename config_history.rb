require 'rubygems'
require 'bundler/setup'
require 'daemons'

require_relative './lib/configuration_reader'
require_relative './lib/git_gateway'
require_relative './lib/section'

INSTALL_DIR = File.expand_path(File.dirname(__FILE__))

module Daemons
  class Application
    def logfile
      INSTALL_DIR + '/config_history.log'
    end

    def output_file
      INSTALL_DIR + '/config_history.log'
    end
  end
end


Daemons.run(INSTALL_DIR + '/lib/runner.rb',
            dir: '/tmp',
            dir_mode: :normal,
            app_name: 'ConfigHistory',
            log_output: true)

`ln -s /tmp/ConfigHistory.output #{INSTALL_DIR}/ConfigHistory.log`