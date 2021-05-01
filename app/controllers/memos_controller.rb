class MemosController < ApplicationController
	before_action :ensure_correct_user, only: [:edit, :update, :destroy]

 def index
 	@memo = Memo.new
 	 @customer = current_user
 @memos = Memo.where(user_id: current_user).order(start_time: "desc").page(params[:page]).per(8)
 end
 
 def edit
  @memo = Memo.find(params[:id])
 end
 
 def create
 	memo = Memo.new(memos_params)
   if  memo.user_id = current_user.id
   	memo.save
       flash[:notice] = "トレーニングを記録しました"
 	    redirect_to memos_path
   else
     render :index
   end
 end
 
 def update
   if @memo.update(memos_params)
      flash[:notice] = "トレーニングを更新しました"
      redirect_to memos_path
   else
     render :edit
   end
 end
 
 def destroy
	   @memo.destroy
	   flash[:notice] = "トレーニングを削除しました"
	   redirect_to memos_path
 end
 
 def ensure_correct_user
 @memo = Memo.find(params[:id])
   unless @memo.user == current_user
     redirect_to memos_path
   end
 end
 
 private
   def memos_params
     params.require(:memo).permit(:user_id,:set,:menu,:start_time,:rep,:weight)
   end
end