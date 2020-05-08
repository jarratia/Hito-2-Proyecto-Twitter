class Api::NewsController < ApplicationController
    def index
        @news = User.all.order(created_at: :desc)
        render json: @news
    end
     
    def show
    end
     
    def create
    @new = New.new(new_params)
    
        if @new.save
            render json: @new, status: :created
        else
            render json: @new.errors, status: :unprocessable_entity
        end
    end
     
    def update
        if @new.update(new_params)
            render json: @new, status: :ok
        else
            render json: @new.errors, status: :unprocessable_entity
        end
    end
     
    def destroy
        @new.destroy
        head :no_content
    end
     
    private

    def set_new
        @new = New.find(params[:id])
    end
    
    def new_params
        params.require(:new).permit(:email, :password, :newname)
    end
end

