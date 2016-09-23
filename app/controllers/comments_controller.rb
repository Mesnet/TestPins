class CommentsController < ApplicationController
  before_action :set_pin, only: [:show, :create, :edit, :update, :destroy]


  def create 
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    @comment.pin_id = @pin.id
    
    if @comment.save 
      redirect_to pin_path(@pin)
      flash[:success] = 'Merci, votre avis nous est essentiel !'
    else 
      redirect_to :back
    end 
  end 

  def destroy
    @comment = @pin.comments.find(params[:id])
    @comment.destroy

    redirect_to pin_path(@pin)
  end




private 

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_pin
    @pin = Pin.find(params[:pin_id])
  end

end
