class Whiistles::QuotedWhiistlesController < ApplicationController
  before_action :set_whiistle, only: [:new, :create]

  def new
    @quoted_whiistle = QuotedWhiistle.new()
  end
  
  def create
    @quoted_whiistle = current_user.quoted_whiistles.new(quoted_whiistles_params.merge base_whiistle_id: params[:whiistle_id])

    if @quoted_whiistle.save
      flash[:notice] = "You quoted the whiistle of #{ @whiistle.user.fullname }"
    else
      flash[:alert] = @quoted_whiistle.errors.full_messages[0]
    end
  end


  private 

  def set_whiistle
    @whiistle = BaseWhiistle.find(params[:whiistle_id])
  end
  
  def quoted_whiistles_params
    params.require(:quoted_whiistle).permit(:body, pictures: [])
  end
end
