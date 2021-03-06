class VehiclesController < ApplicationController

	require 'open-uri'
	require 'json'
	
	def index	
		
		result = JSON.parse(open("http://api.reges.se/gps/v1/vehicle").read)

		result['vehicle'].each do |each_data|
			
			remove_id = each_data.delete('id')
			each_data['train_name'] = remove_id
			
			Vehicle.create(each_data)	
			
		    end

		@vehicles = Vehicle.all	
		
		@groups = []
		
		@vehicles.each do |data|
			@groups.push(data.group)
		end
	end
  
  def checked_types
      @checked_types = Vehicle.where(:type => 'X11')
	  @vehicles = Vehicle.all	
	  @groups = []
	  @vehicles.each do |data|
		@groups.push(data.group)
	  end
  	
    end


end

