class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new #新規作成されたUserオブジェクトをインスタンス変数に代入します。
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] ="ユーザーの新規作成に成功しました。"
      #保存が成功した際はここに記述した処理が実行
      redirect_to @user
    else
      render 'new'
    end
  end
  
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
