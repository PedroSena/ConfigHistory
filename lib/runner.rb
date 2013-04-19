require 'fileutils'

REPO_DIR = INSTALL_DIR + '/.repo'

config_reader = ConfigurationReader.new(INSTALL_DIR+'/config_history.yaml')
git_gateway = GitGateway.new(REPO_DIR)

stopped = false

Signal.trap("TERM") do
  stopped = true
end

while not stopped
  git_gateway.new_repository
  config_reader.sections.each do |section|
    section.required_directories.each do |required_dir|
      unless File.exists?(required_dir)
        FileUtils.mkpath(REPO_DIR+'/'+required_dir)
        p "Creating directory #{required_dir} at #{REPO_DIR}"
      end
    end
    section.valid_files.each do |full_path_to_file|
      destination = REPO_DIR + '/' + full_path_to_file.sub(section.base_dir,'')
      unless File.directory?(full_path_to_file)
        FileUtils.cp(full_path_to_file, destination)
        p "Copying #{full_path_to_file} to #{destination}"
      end
    end
  end
  git_gateway.commit
  sleep(config_reader.time_frame)
end
