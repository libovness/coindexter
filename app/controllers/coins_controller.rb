class CoinsController < ApplicationController

	before_action :authenticate_user!, only: [:edit,:new,:create,:update]

	def index
		page_title = "Coins"
		@categories = Category.all
	end

	def sorted_by_market_cap
		@coins = Coin.all.order(market_cap: 'desc')
	end

	def links
		@links = Coin.friendly.find(params[:id]).paginate(:page => params[:page], :per_page => 10)
		@coin = Coin.friendly.find(params[:id])
		respond_to do |format|
		    format.html
		    format.js
		    format.json
		end
	end

	def trollbox

	end

	def logs
		@coin = Coin.friendly.find(params[:id])
		all_versions = @coin.versions.reverse
		@logs = []
		all_versions.each do |version|
			log = {}
			version.changeset.each do |key, value|
				case key
				when "repositories", "exchanges"
					if value.first == {} || value.first == [] || value.first.nil?
						type = "added"	
					else 
						type = "edited"
					end
					log[:data] = {change: value, change_attr: key, change_type: type}
				when "network_id"
					if value.first.nil? 
						type = "added"
					else
						type = "edited"
						value[0] = Network.find(value[0])
					end
					value[1] = Network.find(value[1])
					change_attr = "Network"
					log[:data] = {change: value, change_attr: change_attr, change_type: type}
				when "coin_info"
					change_attr = "Additional info"
				when "type"
					change_attr = "Asset type"
				when "coin_status"
					change_attr = "Status"
				when "code_license"
					change_attr = "Code license"
				when "proof algorithm"
					change_attr = "Proof algorithm"
				else
					change_attr = key
				end
				if log == {}
					if value.first == ""
						type = "added"
					else
						type = "edited"
					end
					log[:data] = {change: value, change_attr: change_attr, change_type: type}
				end
			end
			log[:user] = version.user
			log[:created_at] = version.created_at
			@logs << log
		end
		respond_to do |format|
		    format.html
		    format.js
		    format.json
		end
	end	

	def show
		@coin = Coin.friendly.find(params[:id])
		unless @coin.one_day_price_change.nil?
			if @coin.one_day_price_change > 0
				@one_day_up = "up"
			else
				@one_day_up = "down"
			end
		end
		unless @coin.one_hour_price_change.nil? 
			if @coin.one_hour_price_change > 0
				@one_hour_up = "up"
			else
				@one_hour_up = "down"
			end
		end
		respond_to do |format|
		    format.html
		    format.js
		    format.json
		end
	end

	def new
		@use_ajax = true
		@coin = Coin.new
		@coin.build_repository
	end

	def edit
		@use_ajax = false
		@coin = Coin.friendly.find(params[:id])
		if @coin.repositories.empty?
			@coin.build_repository
		end
		if @coin.exchanges.empty?
			@coin.build_exchange
		end
	end

	def create
		@coin = Coin.new(coin_params)
	    if @coin.save
	    	@coin.category_id = 2 ? @coin.category_id.nil? : @coin.category_id
	    	@coin.update_prices
	    	@coin.save
			redirect_to @coin
		else
	        render 'new'
	    end
	end

	def update
		@coin = Coin.friendly.find(params[:id])
	  	if @coin.update_attributes(coin_params)
	    	redirect_to @coin
		else
	    	render 'edit'
	  	end
	end

	def destroy
		@coin.destroy
	end

	private

	    def coin_params
	    	params.require(:coin).permit(:name, :coin_status, :coin_info, :application_name, :application_description, :application_status, :application_url, :category_id, :logo, :slug, :coin_type, :network_id, networks: [], network_ids: [], exchanges: {}, repositories: {}, repositories_attributes: [:name, :url, :_destroy], exchanges_attributes: [:name, :url, :_destroy])
	    end

	    def set_has_application(coin)
	    	unless @coin.application_url.nil? && @coin.application.name.nil? && application_description.nil?
				@coin.has_application = true
			end
		end
end