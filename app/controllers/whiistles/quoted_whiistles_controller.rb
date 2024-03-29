# frozen_string_literal: true

class Whiistles::QuotedWhiistlesController < ApplicationController
  before_action :set_quoted_whiistle, only: [:new]

  def new
    @quoting_whiistle = Whiistle.new
  end

  private

  def set_quoted_whiistle
    @quoted_whiistle = BaseWhiistle.find(params[:whiistle_id])
  end
end
