INSTALL_DIR = File.dirname(__FILE__) + '/../'
Dir[INSTALL_DIR + "lib/**/*.rb"].each {|f| require f}


require 'configuration_reader'

describe ConfigurationReader do
  it "should load the configuration file" do
    reader = ConfigurationReader.new
    reader.time_frame.should_not be_nil
    reader.log_level.should_not be_nil
    reader.sections.length.should > 0
  end

  it "should raise error in case of invalid configuration file" do
    expect {
      reader = ConfigurationReader.new('invalid_config_history.yaml')
    }.to raise_error
  end
end