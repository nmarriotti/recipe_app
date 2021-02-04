class CommentsController < ApplicationController
    def create
        @recipe = Recipe.find(params[:recipe_rid])
        @comment = @recipe.comments.create(params[:comment].permit(:name, :comment))
        redirect_to recipe_path(@recipe)
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @comment = @recipe.comments.find(params[:id])
        @comment.destroy
        redirect_to recipe_path(recipe)
    end
end
