class InstrumentsController < ApplicationController
	before_filter :check_logged_in, :only =>[:edit,:update,:delete]
	def new
		@instrument=Instrument.new
	end
	def validates
	end
	def create
		@instrument=Instrument.new(params[:instrument])
		@instrument.save
		redirect_to"/instruments/#{@instrument.id}"
	end
	
	def show
		@instrument=Instrument.find(params[:id])
	end
	def index
		@instruments=Instrument.find(:all)
	end
	def edit
		@instrument=Instrument.find(params[:id])
	end
	def update
		@instrument=Instrument.find(params[:id])
		@instrument.update_attributes(params[:instrument])
		redirect_to"/instruments/#{@instrument.id}"
	end
	def delete
		@instrument=Instrument.find(params[:id])
		@instrument.delete
		redirect_to"/instruments/"
	end
	
	private
	def check_logged_in
		authenticate_or_request_with_http_basic("Instruments") do |username,password|
			username=="admin"&&password=="ww"
		end 
	end
	
	
	
end
