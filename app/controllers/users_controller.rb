class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    #----------------- 追記 -------------------
    @user.avatar.attach(params[:user][:avatar])
    #-----------------------------------------
    if @user.save
      @user.send_activation_email
      flash[:notice] = "アカウント認証メールを送信しました。メールが届きましたら、24時間以内に本文記載の有効化リンクをクリックしてアカウントを認証してください。"
      redirect_to root_url
    else
      render "new", status: :unprocessable_entity
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
       @user.avatar.attach(params[:user][:avatar]) if @user.avatar.blank?
        if params[:user][:avatar_id]
          @user.avatar.purge
        end
  
      redirect_to user_path, notice: 'ユーザー情報を更新しました'
    else
      render :edit
    end
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name, :email,  :avatar)
  end

end