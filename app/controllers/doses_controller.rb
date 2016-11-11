class DosesController < ApplicationController

  before_action :find_cocktail, only: [:destroy, :new, :create]
  before_action :find_dose, only: [:destroy]

  def create
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      flash[:notice] = "#{@dose.ingredient.name} has been added to #{@cocktail.name}"
      redirect_to cocktail_path(@cocktail)
    else
      @review = @cocktail.reviews.new
      render "cocktails/show"
    end
  end

  def destroy
    @dose.destroy
    redirect_to @dose.cocktail
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id]) unless params[:cocktail_id].nil?
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
