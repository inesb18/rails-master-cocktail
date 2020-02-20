class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = set_cocktail
  end

  def create
    @dose = Dose.new(dose_description_and_ingredient)
    @cocktail = set_cocktail
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    dose = set_dose
    dose.destroy
    redirect_to cocktail_path(set_cocktail)
  end

  private

  def set_dose
    Dose.find(params[:id])
  end

  def set_cocktail
    Cocktail.find(params[:cocktail_id])
  end

  def dose_description_and_ingredient
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
