class CommentsController < ApplicationController
  before_action :find_recipe
  before_action :find_comment, only: [:destroy, :edit, :update]
  def create

    @comment = @recipe.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to users_path
    end
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end

  end



  def destroy
    @comment.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def find_comment
    @comment = @recipe.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
