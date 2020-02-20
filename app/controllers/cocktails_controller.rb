class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail = Cocktail.create(cocktail_name)
    redirect_to cocktail_path(cocktail)
  end

  private

  def cocktail_name
    params.require(:cocktail).permit(:name)
  end
end
