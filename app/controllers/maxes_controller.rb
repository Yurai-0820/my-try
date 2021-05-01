class MaxesController < ApplicationController
  before_action :maxes, only: %i[index create edit update]
  before_action :authenticate_user!, only: %i[index create]

  def index
    @max = AddMax.new
    @trainings = Training.all
    @maxes = Max.all
    @limits = Limit.all
    @limit = Limit.new
  end

  def new
    @max = AddMax.new
  end

  def create
    @max = AddMax.new(max_params)
    if @max.valid?
      @max.save
      redirect_to limits_path
    else
      render 'index'
    end

    def edit
      @training = Training.find(params[:id])
      @max = Max.find(params[:id])
    end

    def update
      @max = AddMax.find(params[:id])
      # max = Max.find(params[:id])
      @max.update(max_params)
    end

    def show
      @maxes = Max.find_by(params[:id])
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
