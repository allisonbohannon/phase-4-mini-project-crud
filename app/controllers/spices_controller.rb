class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index 
        render json: Spice.all
    end

    def show
        spice = find_spice
        render json: spice 
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end

    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def destroy 
        spice = find_spice
        spice.destroy
        render json: {}
    end


    private

    def not_found
        render json: {error: 'spice not found'}, status: :not_found
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice 
        Spice.find_by(id: params[:id])
    end

end
