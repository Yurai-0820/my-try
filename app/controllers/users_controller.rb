class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.order('created_at DESC')
    @user = User.all
    @trainings = Training.all
    @training = Training.new
    @maxes = Max.all
    @max = Max.new
    @limits = Limit.all
    @limit = Limit.new
  end

  def new
    @users = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end

    def show; end

    def edit
      @max = Max.find(params[:id])
      @trainings = Training.all
    end

    def update 
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :age, :purpose_body_id, :day_training_time_id)
  end

end
