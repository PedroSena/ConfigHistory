class GitGateway

  attr_accessor :repository_directory

  def initialize(repository_directory)
    @repository_directory = repository_directory
    @prefix = "git --git-dir=#{@repository_directory}/.git --work-tree=#{@repository_directory}/"
  end

  def new_repository(remote_git = nil)
    FileUtils.mkpath(@repository_directory) unless File.directory?(@repository_directory)
    `cd #{@repository_directory}/ && git init .`
    unless remote_git.nil?
      `git remote add origin #{remote_git}`
    end
  end

  def commit(push_remote = false)
    `#{@prefix} add #{@repository_directory}/`
    `#{@prefix} commit -m "#{Time.now}" `
    `git push origin master` if push_remote
  end

  def run(command)
    `#{@prefix} #{command}`
  end

end