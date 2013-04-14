require_relative 'spec_helper'
require 'configuration_reader'

describe ConfigurationReader do
  it "should load the configuration file" do
    reader = ConfigurationReader.new
    reader.time_frame.should_not be_nil
    reader.log_level.should_not be_nil
    reader.sections.length.should > 0
  end

  it "should raise error in case of invalid configuration file" do
    file_path = INSTALL_DIR + 'tests/invalid_config_history.yaml'
    expect {
      ConfigurationReader.new(file_path)
    }.to raise_error
  end
end