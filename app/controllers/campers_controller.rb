class CampersController < ApplicationController
    wrap_parameters format: []

    def index
        camper = Camper.all
        render json: camper 
    end

    def show
        camper = Camper.find_by(id: params[:id])

        if camper
            render json: camper, serializer: CustomCamperSerializer
        else
            render json: { errors: :internal_server_error }, status: :internal_server_error
        end
    end

    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper, status: :created
        else
            render json: { errors: camper.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

end
