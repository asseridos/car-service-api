class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]

  def index
    @cars = Car.all
    render json: @cars
  end

  def show
    render json: @car
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      render json: @car
    else
      render json: {error: "Unable to create car."}, status: 400
    end
  end

  def update
    if @car
      @car.update(car_params)
      render json: {message: "Car was successfully updated"}, status: 200
    else
      render json: {error: "Unable to update car."}, status: 400
    end
  end

  def destroy
    if @car
      @car.destroy
      render json: {message: "Car was successfully deleted"}, status: 200
    else
      render json: {error: "Unable to delete car."}, status: 400
    end
  end

  private

  def car_params
    params.require(:car).permit(:brand, :plate_number, :price)
  end

  def set_car
    @car = Car.find_by(plate_number: params[:id])
  end
end
