class UsersController < ApplicationController


def index
  @users = User.order('created_at DESC')
  @trainings = Training.all
  @maxes = Max.all
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

  def show
  end

  def edit
    @max = Max.find(params[:id])
    @trainings = Training.all
  end

  def update 
  end


end

private

def user_params
  params.require(:user).permit(:nickname,:email,:password,:age,:purpose_body_id,:day_training_time_id)
end

end