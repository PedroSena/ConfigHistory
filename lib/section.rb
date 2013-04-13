class Section
  attr_accessor :name

  def initialize(name,base_dir,files_matching,ignore_files_matching = nil)
    @name = name
    @base_dir = base_dir
    @files_matching = files_matching
    @ignore_files_matching = ignore_files_matching || []
  end

  def valid_files
    all_files.find_all{ |file| is_valid?(file) }.find_all{ |file| ! ignore?(file) }
  end

  private
  def all_files
    Dir.glob(@base_dir + '/**/*')
  end

  def ignore?(relative_path)
    return false if @ignore_files_matching.length < 1
    @ignore_files_matching.find_all{|regex| relative_path.match regex }.length > 0
  end

  def is_valid?(relative_path)
    @files_matching.find_all{|regex| relative_path.match regex }.length > 0
  end

end