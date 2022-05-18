class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    #review params
    @review = Review.new(review_params)
    # we need the id of the restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    #associating the @restaurant with the @review
    @review.restaurant = @restaurant
    # save if valid
    if @review.save
    # redirect
     redirect_to restaurant_path(@restaurant)
    # otherwise render the form
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end


  private

  def review_params
    params.require(:review).permit(:content)

  end



end
