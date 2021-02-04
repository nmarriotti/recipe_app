class CommentsController < ApplicationController
    def create
        @recipe = Recipe.find(params[:recipe_id])
        @comment = @recipe.comments.create(params[:comment].permit(:comment).merge(name: current_user.username))
        redirect_to user_recipe_path(current_user.id, @recipe)
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @comment = @recipe.comments.find(params[:id])
        @comment.destroy
        redirect_to user_recipe_path(current_user.id, @recipe)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:comment).merge(name: current_user.username)
    end
end