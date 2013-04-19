require 'yaml'

class ConfigurationReader

  attr_accessor :time_frame, :log_level, :sections

  def initialize(file_path=nil)
    file_path ||= INSTALL_DIR + 'config_history.yaml'
    config = YAML.load_file file_path
    @time_frame = config["general"]["time_frame"]
    @time_frame = 5 unless @time_frame.is_a? Integer
    @time_frame *= 60
    @sections = []
    raise "You should have at least one section" if config["general"]["sections"].nil?
    config["general"]["sections"].each do |name,content|
      raise "You forgot that the section name goes as first parameter on a section" unless content.is_a? Hash
      ['base_directory','files_matching'].each do |key|
        raise "#{key} missing in section #{name}" if content[key].nil?
      end
      @sections << Section.new(name,content["base_directory"],content["files_matching"],content["ignore_files_matching"])
    end
  end

end