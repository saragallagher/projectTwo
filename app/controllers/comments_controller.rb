class CommentsController < ApplicationController
  before_action :set_recipe

  def create
    @comment = @recipe.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to users_path
    end
  end

  def destroy
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_to users_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
