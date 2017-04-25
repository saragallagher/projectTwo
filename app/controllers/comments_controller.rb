class CommentsController < ApplicationController
  before_action :find_post
  def create

    @comment = @recipe.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to users_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_to users_path
  end

  private

  def find_post
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
