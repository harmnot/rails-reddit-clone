class PublicController < ApplicationController
  def index
    @communities = begin
                     Community.all.limit(5)
                   rescue
                     nil
                   end
    @posts = Post.order(id: :desc).limit(20)
  end

  def profile
    @profile = Account.find_by_username(params[:username])
    @post = @profile.posts
  end


end
