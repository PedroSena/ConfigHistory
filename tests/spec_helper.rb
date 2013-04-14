INSTALL_DIR ||= File.dirname(__FILE__) + '/../'
Dir[INSTALL_DIR + "lib/**/*.rb"].each {|f| require f}
