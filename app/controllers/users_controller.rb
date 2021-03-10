class UsersController < ApplicationController


def index
  @users = User.order('created_at DESC')
  @trainings = Training.all
end

def new
  @users = User.new
end

def create
  @user = User.new(article_params)
  if @user.save
    redirect_to root_path
  else
    render :new
  end
end

private

def user_params
  params.require(:user).permit(:nickname,:email,:password,:age,:purpose_body_id,:day_training_time_id)
end



end