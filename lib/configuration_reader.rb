require 'yaml'

class ConfigurationReader

  attr_accessor :time_frame, :log_level, :sections

  def initialize(file_path=nil)
    file_path ||= INSTALL_DIR + 'config_history.yaml'
    config = YAML.load_file file_path
    @time_frame = config["general"]["time_frame"]
    @time_frame = 5 unless @time_frame.is_a? Integer
    @log_level = config["general"]["log_level"]
    @log_level = "info" unless %w(debug info warning error).include? @log_level
    @sections = []
    config["general"]["sections"].each do |name,content|
      @sections << Section.new(name,content["base_directory"],content["files_matching"],content["ignore_files_matching"])
    end
  end

end