require 'fileutils'

REPO_DIR = INSTALL_DIR + '/.repo'

config_reader = ConfigurationReader.new(INSTALL_DIR+'/config_history.yaml')
git_gateway = GitGateway.new(REPO_DIR)

loop do
  config_reader.sections.each do |section|
    section.required_directories.each do |required_dir|
      FileUtils.mkpath(required_dir) unless File.exists?(required_dir)
      puts "Just created dir #{required_dir}"
    end
    section.valid_files.each do |full_path_to_file|
      destination = REPO_DIR + '/' + full_path_to_file.sub(section.base_dir,'')
      FileUtils.cp(full_path_to_file, destination)
      puts "Just copied #{full_path_to_file} to #{destination}"
    end
  end
  git_gateway.commit
  sleep(config_reader.time_frame)
end
