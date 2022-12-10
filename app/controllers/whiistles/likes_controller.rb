class Whiistles::LikesController < ApplicationController
  before_action :set_whiistle, only: [:create]
  before_action :set_like, only: [:destroy]

  # POST /whiistles/likes or /whiistles/likes.json
  def create
    @like = @whiistle.likes.new(user_id: current_user.id)

    if @like.save
      flash[:notice] = "You liked #{@whiistle.user.fullname}'s whiistle"
    else
      flash[:alert] = @like.errors.full_messages[0]
    end
  end

  # DELETE /whiistles/likes/1 or /whiistles/likes/1.json
  def destroy
    @like.destroy

    flash[:notice] = "You unliked #{@like.whiistle.user.fullname}'s whiistle"
  end

  private 

  def set_whiistle
    @whiistle = BaseWhiistle.find(params[:whiistle_id])
  end

  def set_like
    @like = Like.find(params[:id])
  end
    
end
