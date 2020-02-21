require 'open-uri'

class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @form_invisible = true
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_name)
    unless @cocktail.photo.attached?
      file = URI.open("https://source.unsplash.com/1600x900/?cocktail,#{@cocktail.name.split().join(',')}")
      @cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    end
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_name
    params.require(:cocktail).permit(:name, :photo)
  end
end
