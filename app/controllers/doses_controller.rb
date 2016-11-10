class DosesController < ApplicationController

  before_action :find_cocktail, only: [:destroy, :new, :create]
  before_action :find_dose, only: [:destroy]

  def new
    @ingredients = Ingredient.ordered
    @dose = @cocktail.doses.new
  end

  def create
    @ingredients = Ingredient.ordered
    @ingredient = Ingredient.find(dose_params["ingredient"]) unless dose_params["ingredient"] == ""
    @dose = @cocktail.doses.new(description: dose_params["description"], ingredient: @ingredient)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end
end
