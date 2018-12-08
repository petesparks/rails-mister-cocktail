class CocktailsController < ApplicationController

  def index
    # @ingredient = Ingredient.new
    @dose = Dose.new
    @cocktail = Cocktail.new
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @dose = Dose.new(dose_params)
    if @cocktail.save && @dose.save
      redirect_to cocktail_path
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def dose_params
    params[:cocktail].require(:dose).permit(:description, :ingredient_id)
  end
end
