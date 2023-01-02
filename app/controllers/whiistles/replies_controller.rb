class Whiistles::RepliesController < ApplicationController
  before_action :set_whiistle, only: [:new, :create]

  def new
    @reply = Reply.new()
  end
  
  def create
    @reply = current_user.replies.new(
               reply_params.merge(
                 base_whiistle_id: params[:whiistle_id]
               )
             )

    if @reply.save
      flash[:notice] = 'You replied'
    else
      flash[:alert] = @reply.errors.full_messages[0]
    end
  end


  private 

  def set_whiistle
    @whiistle = BaseWhiistle.find(params[:whiistle_id])
  end
  
  def reply_params
    params.require(:reply).permit(:body, pictures: [])
  end
end
