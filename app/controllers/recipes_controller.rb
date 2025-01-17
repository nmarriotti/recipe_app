class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.where("user_id = ?", current_user.id)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
    @comment = Comment.new
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  def search
    @recipes = Recipe.where("title LIKE ?", "%" + params[:q] + "%").order('title ASC')
    render 
  end

  def all
    @recipes = Recipe.all.order('title ASC')
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to user_recipes_path }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to user_recipes_path }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to user_recipes_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :directions, :description).merge(user_id: current_user.id)
    end
end
