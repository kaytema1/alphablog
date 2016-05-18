class CategoriesController < ApplicationController
	before_action :set_category, only: [:edit, :update, :show, :destroy]

	def index
		@categories = Category.paginate(page: params[:page],per_page: 10)
	end

	def new
		@category = Category.new
	end


	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:success] = "Category saved successfully"
			redirect_to categories_path
		else
			flash.now[:danger] = "Category not saved successfully"
			render 'new'
		end
	end


	def edit

	end

	def update

	end


	def destroy

	end

	private


	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name)
	end

end
