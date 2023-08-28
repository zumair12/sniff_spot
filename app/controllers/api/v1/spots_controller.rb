# frozen_string_literal: true

class Api::V1::SpotsController < ApplicationController
  before_action :find_spot, only: [:show, :update, :destroy]

  # GET /spots
  def index
    @spots = Spot.includes(:reviews).order(spot_order_by)
    render json: @spots.map(&:to_json), status: :ok
  end

  # GET /spots/:id
  def show
    return render json: { errors: "Spot not found." }, status: :not_found if @spot.nil?

    render json: @spot.to_json
  end

  # POST /spots
  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      render json: @spot.to_json, status: :created
    else
      render json: { errors: 'Unable to create Spot.' }, status: :unprocessable_entity
    end
  end

  # PUT /spots/:id
  def update
    if @spot
      @spot.update(spot_params)
      render json: { message: 'Spot successfully updated.' }, status: :ok
    else
      render json: { errors: 'Unable to update Spot.' }, status: :unprocessable_entity
    end
  end

  # DELETE /spots/:id
  def destroy
    if @spot
      @spot.destroy
      render json: { message: 'Spot successfully deleted.' }, status: :ok
    else
      render json: { error: 'Unable to delete Spot.' }, status: :unprocessable_entity
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:title, :description, :price, images: [])
  end

  def find_spot
    @spot = Spot.find_by(id: params[:id])
  end

  def spot_order_by
    order = params[:price_order] == 'asc' ? 'asc' : 'desc'

    "price #{order}"
  end
end
