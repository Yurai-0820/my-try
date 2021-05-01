class LimitsController < ApplicationController
  before_action :limits, only: %i[ edit update]

 def index
  @limits = Limit.all
  @maxes = Max.all
 end
  def create; end

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
    params.require(:limit).permit(:max_weight, :rep, :max_id)
  end
end
