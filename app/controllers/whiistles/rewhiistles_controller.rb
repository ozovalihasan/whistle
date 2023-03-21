# frozen_string_literal: true

module Whiistles
  class RewhiistlesController < ApplicationController
    before_action :set_whiistle, only: [:create]
    before_action :set_rewhiistle, only: [:destroy]

    def create
      @rewhiistle = current_user.rewhiistles.new(whiistle: @whiistle)

      if @rewhiistle.save
        flash[:notice] = 'You rewhiistled'
      else
        flash[:alert] = @rewhiistle.errors.full_messages[0]
      end
    end

    def destroy
      @rewhiistle.destroy

      flash[:notice] = "You have removed #{@rewhiistle.whiistle.user.fullname}'s whiistle's rewhiistle"
    end

    private

    def set_whiistle
      @whiistle = BaseWhiistle.find(params[:whiistle_id])
    end

    def set_rewhiistle
      @rewhiistle = Rewhiistle.find(params[:id])
    end
  end
end
