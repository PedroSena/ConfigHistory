INSTALL_DIR = File.dirname(__FILE__) + '/../'
Dir[INSTALL_DIR + "lib/**/*.rb"].each {|f| require f}


require 'configuration_reader'

describe ConfigurationReader do
  it "should load the configuration file" do
    reader = ConfigurationReader.new
    reader.config.should_not be_nil
  end
end