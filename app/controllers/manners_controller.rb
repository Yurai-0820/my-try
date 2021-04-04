class MannersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :manners, only: %i[edit update show destroy]
  before_action :move_to_index, only: %i[edit update destroy]

  def index
    @manners = Manner.order('created_at DESC')
  end

  def new
    @manner = Manner.new
  end

  def create
    @manner = Manner.new(manner_params)

    redirect_to root_path if @manner.save
  end

  def show; end

  def edit; end

  def destroy; end

  def manner_params
    params.require(:manner).permit(:genre_id, :title, :description).merge(user_id: current_user.id)
  end

  def manners
    @manner = Manner.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id != 1
  end
end
