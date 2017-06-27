class LinksController < ApplicationController

	before_action :authenticate_user!, only: [:edit,:new,:create,:update]

	def network_index
		@network = Network.friendly.find(params[:network_id])
		@links = @network.links
		respond_to do |format|
		    format.html
		    format.js
		    format.json
		end
	end

	def index
		if !params[:network_id].nil?
      		@network = Network.friendly.find(params[:network_id])
      	end
		@links = Link.all.paginate(:page => params[:page], :per_page => 10)
		respond_to do |format|
		    format.html
		    format.js
		    format.json
		end
	end

	def show
		@link = Link.friendly.find(params[:id])
		@network = @link.networks.first
		respond_to do |format|
		    format.html
		    format.js
		    format.json
		end
	end


	def new
		@use_ajax = true
		if params.has_key?(:network_id)
			@network = Network.friendly.find(params[:network_id])
			@link = @network.links.new
		else
			@link = Link.new
		end
		respond_to do |format|
		    format.html
		    format.js
		    format.json
		end
	end

	def edit
		@use_ajax = true
		@link = Link.friendly.find(params[:id])
		respond_to do |format|
		    format.html
		    format.js
		    format.json
		end
	end

	def create
		@link = current_user.links.new(link_params)
		puts "link_params are #{link_params}"
		if @link.save
	    	if @link.networks.nil?
	    		redirect_to @link
	    	else 
	    		@network = @link.networks.first
	    		redirect_to network_links_path(@link.networks.first, @link)
	    	end
		else
	        puts 'not working'
	    end
	end

	def update
		@link = Link.friendly.find(params[:id])
	  	if @link.update_attributes(link_params)
	    	redirect_to @link
		else
	    	render 'edit'
	  	end
	end

	def destroy
		@link.destroy
	end

	def comment_count(link)
		link.comments.count
	end

	private

	    def link_params
	    	params.require(:link).permit(:link, :title, :body, coin_ids: [], network_ids: [])
	    end	

end
