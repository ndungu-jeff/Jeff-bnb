class HousesController < ApplicationController
    skip_before_action :authorize, only: [:create, :index, :owner_houses]

    # "/post" Creates a new instance of a House (Create)
    def create
        house = House.create!(house_params)
        render json: house, status: :created
    end

    # '/houses' Displays all houses
    def index
        houses = House.all.limit(10)
        render json: houses
    end

    # get owner houses
    def owner_houses
        owners_houses = House.where(owner_id: params[:owner_id])
        render json: owners_houses
    end

    # '/house/:id' displays a house of id in params(Read by show in rails)
    def show
        house = find_house
        render json: house
    end

    # '/house/:id' edits an house of id in params(Update)
    def update
        house = find_house
        house.update!(house_params)
        render json: house
    end

    # '/house/:id' deletes an house of id in params(Delete by destroy)
    def destroy
        house = find_house
        house.destroy
        head :no_content
    end

    private
    
    def find_house
        House.find(params[:id])
    end

    def house_params
        params.permit(:name, :description, :location, :price, :owner_id, :image_url)
    end
end
