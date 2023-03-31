class ClientHousesController < ApplicationController
    skip_before_action :authorize, only: [:create, :show, :clients_booked, :houses_booked]

    # "/post" Creates a new instance of a House (Create)
    def create
        client_house = ClientHouse.create!(client_house_params)        
        render json: client_house, status: :created
    end

    # '/owner/:id' displays an owner of id in params(Read by show in rails)
    def show
        client_house = ClientHouse.find(params[:id])
        render json: client_house
    end

    # instance method to get all owner clients
    def clients_booked
        myclients =  ClientHouse.where(owner_id: params[:owner_id])
        render json: myclients
    end

    # instance method to get all client houses
    def houses_booked
        clientHouses =  ClientHouse.where(client_id: params[:client_id])
        render json: clientHouses
    end

    # '/house/:id' edits a client house entry of id in params(Update)
    def update
        client_house = find_client_houses
        client_house.update!(client_house_params)
        render json: client_house
    end

    private
    
    def find_client_houses
        ClientHouse.find(params[:id])
    end

    def client_house_params
        params.permit(:client_id, :house_id, :owner_id)
    end
end
