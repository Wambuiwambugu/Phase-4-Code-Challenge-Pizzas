class RestaurantPizzasController < ApplicationController
    def create
        restaurant_pizza = RestaurantPizza.create(restaurant_pizza_params)
        if restaurant_pizza.save
            render json: restaurant_pizza.pizza, status: :created 
        else 
            render json: {errors: ["Validation errors"]}, status: :unprocessable_entity
        end
    end

    private
    def restaurant_pizza_params
        params.require(:restaurant_pizza).permit(:price, :pizza_id, :restaurant_id)
    end

end
