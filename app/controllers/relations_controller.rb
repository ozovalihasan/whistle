# frozen_string_literal: true

class RelationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_relation, only: [:destroy]

  def create
    @relation = Relation.new(relation_params.merge(following_id: current_user.id))

    if @relation.save
      flash[:notice] = "You started to follow #{User.find(@relation.followed_id).fullname}"
    else
      flash[:alert] = @relation.errors.full_messages[0]
    end
  end

  def destroy
    @relation.destroy
    flash[:notice] = "You gave up to follow #{User.find(@relation.followed_id).fullname}"
  end

  private

  def set_relation
    @relation = Relation.find(params[:id])
  end

  def relation_params
    params.require(:relation).permit(:followed_id)
  end
end
