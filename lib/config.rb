require 'require.rb'
require 'yaml'

class Rconfig
	config = YAML.load_file("config.yml")
    class << self; attr_accessor :vnstat_path end
    class << self; attr_accessor :interface end
    class << self; attr_accessor :port	end
    
    @vnstat_path = config["vnstat_path"]
    @interface = config["interface"]
    @port = config["port"]
  end