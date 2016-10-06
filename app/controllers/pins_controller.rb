class PinsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index 
    @pins = Pin.all.order("created_at DESC")
  end 

  def show 
  end 



  def new
   @pin = Pin.new
   @users = User.all.artist
  end

  def create 
    @pin = current_user.pins.build(pin_params)
    if @pin.save 
      redirect_to @pin, notice: "successfully created!"
    else 
      render 'new'
    end
  end 
 
  def edit 
    
  end 

  def update 
    if @pin.update(pin_params)
      redirect_to @pin, notice: "successfully updated !"
    else 
      render 'edit'
    end
  end 

  def destroy
    @pin.destroy
    redirect_to root_path
  end 

  def upvote 
    @pin.upvote_from current_user
    redirect_to :back
  end 

  def downvote
    @pin.downvote_from current_user
    redirect_to :back
  end 

  private



  def pin_params
    params.require(:pin).permit(:title, :description, :image, :pin_maker)
  end 

  def find_pin
    @pin = Pin.find(params[:id])
  end 

end
