class UsersController < ApplicationController
  def show
    # 5章で追加
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end
  
  # ユーザーページの編集
  def edit
    @user = User.find(params[:id])
  end
  
  # 5章で追加。編集データの保存
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
