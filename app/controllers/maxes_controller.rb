class MaxesController < ApplicationController

  before_action :maxes, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

    def index
      @limits = Limit.all
    end

    def new
      @max = AddMax.new
    end

    
    def create

      @max = AddMax.new(max_params)
      if @max.valid?
        @max.save
        redirect_to training_maxes_path
      else
        render 'index'
      end

    def edit

    end

    def update
    end

    def show
    end


    end
    
    private
    
    def max_params
      params.require(:add_max).permit(:max_weight, :rep).merge(
        user_id: current_user.id, training_id: params[:training_id]
      )
    end
    
    def maxes
      @training = Training.find(params[:training_id])
    end
    
end

