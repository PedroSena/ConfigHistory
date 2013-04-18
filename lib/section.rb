require 'pathname'

class Section
  attr_accessor :name, :base_dir

  def initialize(name,base_dir,files_matching,ignore_files_matching = nil)
    @name = name
    @base_dir = base_dir
    @files_matching = files_matching
    @ignore_files_matching = ignore_files_matching || []
  end

  def valid_files
    all = wrap(all_files)
    valid = wrap(all.select{|file| is_valid?(file)})
    valid.select{|file| !ignore?(file)}
  end

  def required_directories
    wrap(wrap(valid_files).map{|file_or_dir| get_all_dirs(file_or_dir)}).uniq.reduce([],:|)
  end

  def wrap(to_wrap)
    return to_wrap if to_wrap.is_a?(Array)
    [to_wrap]
  end

  private
  def all_files
     Dir.glob(@base_dir + '/**/*')
  end

  def ignore?(relative_path)
    wrap(@ignore_files_matching).select{|regex| relative_path.match regex}.length > 0
  end

  def is_valid?(relative_path)
    @files_matching.select{|regex| relative_path.match regex}.length > 0
  end

  def get_all_dirs(relative)
    absolute_path = Pathname.new @base_dir
    relative_path = Pathname.new(relative).relative_path_from(absolute_path).to_s
    return [] unless relative_path.include?("/")
    as_array = relative_path.split("/")
    as_array.pop
    [as_array.join('/')]
  end

end