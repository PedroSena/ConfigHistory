INSTALL_DIR = File.dirname(__FILE__) + '/../'
Dir[INSTALL_DIR + "lib/**/*.rb"].each {|f| require f}

require 'section'

describe Section do

  it "should list 37 valid conf files" do
    section = Section.new('apache2', '/etc/apache2', ['.*.conf'])
    paths_to_files = section.valid_files
    paths_to_files.length.should eq 37
    paths_to_files.each do |path|
      path.should match /.*conf/
    end
  end

  it "should list 35 valid conf files because 2 were ignored" do
    section = Section.new('apache2', '/etc/apache2', ['.*.conf'], ['php5.conf'])
    paths_to_files = section.valid_files
    paths_to_files.length.should eq 35
    paths_to_files.each do |path|
      path.should match /.*conf/
    end
  end

end