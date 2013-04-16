require_relative 'spec_helper'
require 'section'

describe Section do

  context "All apache files" do

    before(:each) do
      @section = Section.new('apache2', '/etc/apache2', ['.*.conf'])
    end

    it "should list 37 valid conf files" do
      paths_to_files = @section.valid_files
      paths_to_files.length.should > 30
      paths_to_files.each do |path|
        path.should match /.*conf/
      end
    end

    it "should list all directories that need to be created in order to copy valid files" do
      required_directories = @section.required_directories
      required_directories.length.should > 3
    end
  end

  it "should list 35 valid conf files because 2 were ignored" do
    section = Section.new('apache2', '/etc/apache2', ['.*.conf'], ['php5.conf'])
    paths_to_files = section.valid_files
    paths_to_files.length.should > 30
    paths_to_files.each do |path|
      path.should match /.*conf/
    end
  end

end