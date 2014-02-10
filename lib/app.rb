#!/usr/bin/env ruby
require "require.rb"

set :views, './views'
set :public_dir, './public'

class App < Sinatra::Application

  set :static, true                             # set up static file routing
  set :public, ENV['GEM_HOME']+'/gems/rvnstat-1.0.4/public'
  
  set :views,  ENV['GEM_HOME']+'/gems/rvnstat-1.0.4/views'
  
 get '/' do
  erb :index
 end

get '/live_traffic' do
  erb :live_traffic, :layout => false
 end

get '/live' do
    newVnstat = Vnstat.new
    @x = newVnstat.live_traffic
    content_type :json
    results = []
    time = Time.now.to_i * 1000
    json = results.push(time,@x).to_json
end

 get '/day_detail' do
 	newVnstat = Vnstat.new
 	x = newVnstat.run(Rconfig.vnstat_path,Rconfig.interface)
 	y = x[:day]
 	@dates = []
 	@rx = []
 	@tx = []
 	y.each do |z|
 		z.each do |x|
	 		@dates.push(x[:date])
	 		@rx.push(x[:rx].to_i / 1024)
	 		@tx.push(x[:tx].to_i / 1024)
			end
       	end
       	erb :day_detail, :layout => false
 end
 
  get '/day_total' do
 	newVnstat = Vnstat.new
 	x = newVnstat.run(Rconfig.vnstat_path,Rconfig.interface)
 	y = x[:day]
 	@total = []
 	@dates = []
 	y.each do |z|
 		z.each do |x|
	 		@total.push(x[:total].to_i / 1024)
	 		@dates.push(x[:date])
			end
       	end
       	erb :day_total, :layout => false
    end

  get '/top_ten' do
  	newVnstat = Vnstat.new
 	x = newVnstat.run(Rconfig.vnstat_path,Rconfig.interface)
 	y = x[:top]
 	@top = []
 	y.each do |z|
 		z.each do |x|
 		  @top.push(:date => x[:date],:rx => x[:rx],:tx => x[:tx],:total => x[:total])
 		end
 	end
  	erb :top_ten, :layout => false
  end
  
  get '/monthly' do
    newVnstat = Vnstat.new
  x = newVnstat.run(Rconfig.vnstat_path,Rconfig.interface)
  y = x[:month]
  @top = []
  y.each do |z|
    z.each do |x|
      @top.push(:date => x[:date],:rx => x[:rx],:tx => x[:tx],:total => x[:total])
    end
  end
    erb :monthly, :layout => false
  end

  get '/hourly' do
    newVnstat = Vnstat.new
  x = newVnstat.run(Rconfig.vnstat_path,Rconfig.interface)
  y = x[:hour]
  @hour = []
  y.each do |z|
    z.each do |x|
      @hour.push(:date => x[:date],:rx => x[:krx],:tx => x[:ktx])
    end
  end
    erb :hourly, :layout => false
  end

end
