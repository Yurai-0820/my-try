class TrainingsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :trainings, only: %i[edit update show destroy]
  before_action :move_to_index, only: %i[edit update destroy]

  def index
    @trainings = Training.order('created_at DESC')
    @trainings = Training.all
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)

    redirect_to root_path if @training.save
  end

  def show; end

  def edit; end

  def destroy; end

  private

  def training_params
    params.require(:training).permit(:muscle_part_id, :training_name, :target_muscle, :training_description,
                                     :video_url).merge(user_id: current_user.id)
  end

  def trainings
    @training = Training.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id != 1
  end
end
