class RestaurantsController < ApplicationController
    def index
        restaurants = Restaurant.all
        render json: restaurants, except: [:created_at, :updated_at], status: :ok
    end

    def show 
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            render json: restaurant.as_json( except: [:created_at, :updated_at], include: {pizzas: {except: [:created_at, :updated_at]}})
        else
            render_not_found
        end
    end

    def destroy
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            restaurant.destroy
            head :no_content
        else 
            render_not_found
        end
    end

    private
     def render_not_found
        render json: {error: "Restaurant not found"}, status: :not_found
     end
end
