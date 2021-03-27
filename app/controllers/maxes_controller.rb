class MaxesController < ApplicationController

  before_action :maxes, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

    def index
      @max = AddMax.new
      @max = Max.find_by(training: params[:training])
    end

    
    def create
      @max = AddMax.new(max_params)
      end
    
    
    

    
    private
    
    def maxes_params
      params.require(:max).permit(:max_weight,:rep).merge(
        user_id: current_user.id, training_id: params[:training_id]
      )
    end
    
    def maxes
      @training = Training.find(params[:training_id])
    end
    
end

