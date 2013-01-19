# coding: utf-8
class LikesController < ApplicationController
  def create
    like = Like.new
    like.user_id = params[:user_id].to_i
    like.work_id = params[:work_id].to_i
    like.save
    # if like.save
    #  redirect_to :back, :notice => "ファイトを送りました。"
    # end
  end

  def destroy
  end
end
