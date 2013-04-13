require 'yaml'

class ConfigurationReader

  attr_accessor :config

  def initialize(file_path=nil)
    file_path ||= INSTALL_DIR + 'config_history.yaml'
    @config = YAML.load_file file_path
    puts config.inspect
  end

end