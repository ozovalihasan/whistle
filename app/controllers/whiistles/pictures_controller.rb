class Whiistles::PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_whiistle, only: [:index]

  def index
    @pictures = @whiistle.pictures
    @index = params[:index] || 1
  end

  private 

  def set_whiistle
    @whiistle = BaseWhiistle.find(params[:whiistle_id])
  end

end
