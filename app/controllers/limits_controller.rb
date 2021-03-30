class LimitsController < ApplicationController
  before_action :limits, only: [:edit, :update]

  def create
  end

  def edit
    @limit = Limit.find(params[:id])
  end

  def update
    @limit = Limit.find(params[:id])
    if @limit.update(limit_params)
      redirect_to root_path
    else
      render :edit
    end
  end


private

def limits
  limit = Limit.find(params[:id])
end

def limit_params
  params.require(:limit).permit(:max_weight, :rep)
end


end
