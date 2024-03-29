module Api
	module V1
		class ProductsController < ApplicationController
			class Product < ::Product
				def as_json(options = {})
					super.merge(PN: name)
				end
			end


			def index
			    render json: Product.all
			end

			def show
				render json: Product.find(params[:id])	
			end

			#respond_to :json

			#def index
			#	respond_with Product.all
			#end

			#def show
			#	respond_with Product.find(params[:id])
			#end

			def create 
				respond_with Product.create(params[:product])
			end

			def update
				respond_with Product.update(params[:id], params[:product])			
			end

			def destroy
				respond_with Product.destroy(params[:id])
			end



		end
	end
end