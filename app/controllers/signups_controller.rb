class SignupsController < ApplicationController
    wrap_parameters format: []

    def create
        signup = Signup.create(signup_params)
        if signup.valid?
            render json: signup, status: :created
        else
            render json: { errors: signup.errors.full_messages }
        end
    end

    private

    def signup_params
        params.permit(:name, :age)
    end
end
