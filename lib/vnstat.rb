require 'require.rb'

class Vnstat
	#run vmstat and grab data
def live_traffic
	traffic = nil
	traffic = Vidibus::Sysinfo.throughput
	return traffic
end

def run(vnstat_path,interface)
		v = %x[#{vnstat_path} --dumpdb -i #{interface}]
		hash = {}
		day = []
		month =[]
		hour = []
		date = nil
		rx = nil
		tx = nil
		total = nil
		array = []
		top = []
		x =  v.each_line.each do |y|
		  array.push(y)
		end

		array.each do |y|
							if y[0] == "d"
								x = y.split(';')
								if x[7].chomp == '1'
					                        date = x[2].chomp.to_i
					                        rx = x[3].to_i
					                        tx = x[4].to_i
					                        total = rx + tx
											b = [{:date => Time.at(date).strftime("%D"),:rx => Filesize.from("#{rx} MB").to_f('KB'),:tx => Filesize.from("#{tx} MB").to_f('KB'),:total => Filesize.from("#{total} MB").to_f('KB')}]
					                        day.push(b)
					            end
					                      	
					        elsif y[0] == "m"
								x = y.split(';')
								if x[7].chomp == '1'
					                        date = x[2].chomp.to_i
					                        rx = x[3].to_i
					                        tx = x[4].to_i
					                        total = rx + tx
											b = [{:date => Time.at(date).strftime("%B"),:rx => Filesize.from("#{rx} MB").pretty,:tx => Filesize.from("#{tx} MB").pretty,:total => Filesize.from("#{total} MB").pretty}]					                        
					                        month.push(b)
					            end


					        elsif y[0] == "h"
					        				x = y.split(';')
					                        date = x[2].chomp.to_i
					                        krx = x[3].chomp
					                        ktx = x[4].chomp
					                        b = [{:date => Time.at(date).strftime("%D - %l%P"),:krx => Filesize.from("#{krx} KB").pretty,:ktx => Filesize.from("#{ktx} KB").pretty}]
					                        hour.push(b)
					        end
	end					        	
					        array[55...65].each do |y|
					        	x = y.split(';')
								if x[7].chomp == '1'
					                        date = x[2].chomp.to_i
					                        rx = x[3].to_i
					                        tx = x[4].to_i
					                        total = rx + tx
											b = [{:date => Time.at(date).strftime("%D"),:rx => Filesize.from("#{rx} MB").pretty,:tx => Filesize.from("#{tx} MB").pretty,:total => Filesize.from("#{total} MB").pretty}]					                        
					                        top.push(b)
					            end
							end
	hash = { :day => day,:month => month, :hour => hour,:top => top}
	return hash
	end
end