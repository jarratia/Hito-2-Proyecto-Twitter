class Api::DatesController < ApplicationController

    def date
        @tweets = Tweet.where("updated_at <= ? AND updated_at >= ?", params[:date1], params[:date2])
    
        render json: @tweets
    end  

end