# Rvnstat

Ruby + Sinatra + Bootstrap + Highcharts + vnstat = awesome sauce!

## Requirements
 - vnstat
 - sinatra
 - vidibus-sysinfo
 - filesize
 - sinatra
## Installation
gem install rvnstat

## Usage

You can run it via nginx/apache with passenger or with rackup.

 - Add your path to vnstat, port and the interface you want to pull data from in the rvnstat.yml file.
 - Place your rvnstat.yml in the folder where you run the binary:
 	- Run 'rvnstat' to start 	
 - Access it via http://127.0.0.1:<port>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
