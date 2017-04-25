class RecipesController < ApplicationController
  def index
    @recipes = Recipe.of_followed_users(current_user.following).order('created_at DESC')
  end

  def show
    @recipe = Recipe.find(params[:id])

  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to user_path(@recipe.user)
    else
      redirect_to new_recipe_path
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to user_path(@recipe.user)
    else
      redirect_to edit_recipe_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      redirect_to user_path(current_user)
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :difficulty_level, :time)
  end
end
