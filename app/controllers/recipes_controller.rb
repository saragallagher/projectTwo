class RecipesController < ApplicationController
  before_action :owned_recipe, only: [:edit, :update, :destroy]
  def index
    @recipes = Recipe.all
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

  def owned_recipe
    @recipe = Recipe.find(params[:id])
    unless current_user == @recipe.user
      redirect_to users_path
    end
  end
end
