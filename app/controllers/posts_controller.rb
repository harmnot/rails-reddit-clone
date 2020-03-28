class PostsController < ApplicationController
  before_action :authenticate_account!, unless: [ :index, :show]
  before_action :set_post, only: [:show]
  before_action :auth_subscriber, only: [:new]

  def index
    @posts = Post.all rescue  nil
  end

  def show
    @comment = Comment.new
  end

  def new
    @community = Community.find(params[:community_id])
    @post = Post.new
  end

  def create
    @post = Post.new post_values
    puts current_account.id
    @post.account_id = current_account.id
    @post.community_id = params[:community_id]

    if @post.save
      redirect_to community_path(@post.account_id)
    else
      # @community = Community.find(params[:community_id])
      render :new
    end
  end

  private

  def set_post
    @post = Post.includes(:comments).find(params[:id]) rescue nil
  end

  def post_values
    params.require(:post).permit(:title, :body)
  end

  def auth_subscriber
    unless Subscription.where(account_id: current_account.id, community_id: params[:community_id]).any?
      redirect_to root_path
    end
  end

end
