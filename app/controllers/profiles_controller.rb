class ProfilesController < ApplicationController
   before_action :owned_profile, only: [:edit, :update]
   before_action :authenticate_user!

  def show  
    @pins = User.find_by(pseudo: params[:pseudo]).pins.order('created_at DESC')
    @user = User.find_by(pseudo: params[:pseudo])
  end   

  def edit  
    @user = User.find_by(pseudo: params[:pseudo])
  end

  def update  
    @user = User.find_by(pseudo: params[:pseudo])
    if @user.update(profile_params)
      flash[:success] = 'Your profile has been updated.'
      redirect_to profile_path(@user.pseudo)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def owned_profile  
    @user = User.find_by(user_name: params[:user_name])
    unless current_user == @user
      flash[:alert] = "That profile doesn't belong to you!"
      redirect_to root_path
    end
  end

  
  private

    def profile_params  
      params.require(:user).permit(:avatar, :bio)
    end  
  
end
