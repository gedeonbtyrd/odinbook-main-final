class FriendRequestsController < ApplicationController
  def create
    @friend_request = FriendRequest.create!(friend_request_params)
    redirect_to users_path
  end

  def update
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.update(friend_request_params)
    redirect_to request.referrer
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:sent_by_id, :sent_to_id, :status)
  end
end
