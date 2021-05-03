class LimitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user
  # before_action :limits, only: %i[ edit update]

  def index
    @limits = Limit.all
    # @current_user ||= User.find_by(id: session[:user_id])
    @limit = Limit.where(params[:id])
    # @limit = Limit.find_by(id: params[:id])
    @user = current_user.id
    #@limit = Limit.new
    #@max = AddMax.new
  end

  def new
    
  end

  def create
    @limit = Limit.new(
      limit_params
    )
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


def set_current_user
  @current_user = User.find_by(id: session[:user_id])
end

  # def limits
  #   limit = Limit.find(params[:id])
  # end

  def limit_params
    params.require(:limit).permit(:max_weight, :rep).merge(max_id: max_id, user_id: current_user.id)
  end
end
