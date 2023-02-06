class ActivitiesController < ApplicationController

    def index
        activity = Activity.all
        render json: activity
    end

    # def show
    #     activity = Activity.find(params[:id])
    #     render json: activity
    # end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy

        head :no_content
    end

end
