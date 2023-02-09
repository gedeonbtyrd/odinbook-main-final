class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:comments, :likes, user: [:profile]).user_and_friends_posts(current_user).sorted_by_date
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
