class RecipesController < ApplicationController
	before_action :require_permission, only: [:edit, :destroy, :update]
	before_action :find_recipe, only: [:show, :update, :edit, :destroy] #only on the SUED
	before_action :authenticate_user!, except: [:index, :show]
	#SINDUEC
	def index
		@recipes = Recipe.all.order("created_at DESC")
	end

	def show

	end

	def new
		@recipe = current_user.recipes.build

	end

	def create
		@recipe = current_user.recipes.build(recipe_params)

		if @recipe.save #when we redirect to the @recipe instance, we re redirecting to the show page of the instance recipe
			redirect_to @recipe, notice: "Successfully created new recipe"
		else
			render "new" #it should render the new form
		end
	end



	


	def edit
		
	end
	
	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe, notice: "Successfully Updated"
		else
			render "edit" #renders the edit form
		end
	end

	def destroy
		@recipe.destroy #after destroy we must to redirect
		redirect_to root_path, notice: "Successfully Deleted Recipe"
	end


	private

	def require_permission
	  if current_user != Recipe.find(params[:id]).user
	    redirect_to root_path, notice: "You cannot Edit or Delete A Recipe not created by You"
	    #Or do something else here
	  end
	end


	#let create a recipe finder under the private method above
	#we find it from the Recipe model
	def find_recipe
		@recipe = Recipe.find(params[:id]) #lets now add this to the before action
	end

	def recipe_params
		params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy] ,
		directions_attributes: [:id, :step, :_destroy])#we add the image field to it so that it can be saved
	end

	
end
#ingredients_attributes and directions_attributes contains all the field we wanna save to the db