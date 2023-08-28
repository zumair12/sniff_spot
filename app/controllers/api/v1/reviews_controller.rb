# frozen_string_literal: true

class Api::V1::ReviewsController < ApplicationController
  before_action :find_review, only: [:update]
  before_action :find_spot

  # GET /spots/:spot_id/reviews
  def index
    return render json: { errors: 'Spot not found.' } if @spot.nil?

    render json: @spot.reviews.paginate(page: params[:page])
  end

  # POST /spots/:spot_id/reviews
  def create
    @review = @spot.reviews.new(review_params)
    if @review.save
      render json: @review, status: :created
    else
      render json: { error: 'Unable to create Review.' }, status: :unprocessable_entity
    end
  end

  # PUT /spots/:spot_id/reviews/:id
  def update
    if @review
      @review.update(review_params)
      render json: { message: 'Review successfully updated.' }, status: :ok
    else
      render json: { error: 'Unable to update Review.' }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_review
    @review = Review.find_by(id: params[:id])
  end

  def find_spot
    @spot = Spot.find_by(id: params[:spot_id])    
  end
end
