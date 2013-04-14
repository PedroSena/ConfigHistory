class GitGateway

  attr_accessor :repository_directory

  def initialize(repository_directory)
    @repository_directory = repository_directory
    @prefix = "git --git-dir=#{@repository_directory}/.git --work-tree=#{@repository_directory}/"
  end

  def new_repository
    FileUtils.mkpath(@repository_directory) unless File.directory?(@repository_directory)
    system "cd #{@repository_directory}/ && git init ."
  end

end