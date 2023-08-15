class PizzasController < ApplicationController
    def index
        pizzas = Pizza.find(params[:id])
        render json: pizzas
    end
end
