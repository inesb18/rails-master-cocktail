class DosesController < ApplicationController
  def create
    @dose = Dose.new(dose_description_and_ingredient)
    @cocktail = set_cocktail
    @dose.cocktail = @cocktail
    @review = Review.new
    @form_invisible = false
    if @dose.save
      # redirect_to cocktail_path(@cocktail)
      @dose = Dose.new
    end
    render './cocktails/show'
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
