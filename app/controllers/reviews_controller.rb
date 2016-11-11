class ReviewsController < ApplicationController

  before_action :find_cocktail, only: [:create]

  def create
    @review = @cocktail.reviews.new(review_params)
    if @review.save
      flash[:notice] = "A new review has been added to #{@cocktail.name}"
      redirect_to cocktail_path(@cocktail)
    else
      @dose = @cocktail.doses.new
      render "cocktails/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id]) unless params[:cocktail_id].nil?
  end

end
