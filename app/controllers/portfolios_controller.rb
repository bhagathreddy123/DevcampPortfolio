class PortfoliosController < ApplicationController
	layout "portfolio"
	access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_item = Portfolio.new
		3.times { @portfolio_item.technologies.build }
	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)
		if @portfolio_item.save
			redirect_to portfolios_path, notice: 'Your portfolio item is now live.' 
		else
			render :new 
		end
	end

	def edit
		@portfolio_item = Portfolio.find(params[:id]) 
	end

	def update
		@portfolio_item = Portfolio.find(params[:id]) 
		if @portfolio_item.update(params.require(:portfolio).permit(:title, :sub_title, :body))
			redirect_to portfolios_path, notice: 'Your portfolio item is now live.' 
		else
			render :edit 
		end
	end

	def angular
	    @angular_portfolio_items = Portfolio.angular
    end

	def show 
		@portfolio_item = Portfolio.find(params[:id]) 
	end

	def destroy
		@portfolio_item = Portfolio.find(params[:id])
		@portfolio_item.destroy
		redirect_to portfolios_path, notice: 'Your Portfolio item is deleted'
	end

	private

	def portfolio_params
		params.require(:portfolio).permit(:title, :sub_title, :body, technologies_attributes: [:name])
	end
end
