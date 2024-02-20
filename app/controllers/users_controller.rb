class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @blogs = @user.blogs.order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    @user.avatar.attach(params[:user][:avatar]) if params[:user][:avatar].present?
    
    if @user.save
      # Uncomment the following line if email activation is required
      # Commented out temporarily for illustration purposes
      # Uncomment and configure according to your mailer settings
      # UserMailer.with(user: @user).account_activation.deliver_now

      flash[:notice] = "アカウント認証メールを送信しました。メールが届きましたら、24時間以内に本文記載の有効化リンクをクリックしてアカウントを認証してください。"
      redirect_to root_url
    else
      render "new", status: :unprocessable_entity
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      if params[:user][:avatar].present?
        @user.avatar.attach(params[:user][:avatar])
      end
      flash[:notice] = "プロフィールが変更されました"
      redirect_to @user
    else
      render "edit", status: :unprocessable_entity
    end
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end
end