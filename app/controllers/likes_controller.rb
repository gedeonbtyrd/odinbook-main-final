class LikesController < ApplicationController
  def create
    @like = Like.create!(like_params)
    redirect_to request.referrer
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to request.referrer
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
