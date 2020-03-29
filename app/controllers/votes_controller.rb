class VotesController < ApplicationController

  def create
    # post_id = params[:vote][:post_id]
    post_id = params[:post_id]
    vote = Vote.new
    vote.upvote = params[:upvote]
    vote.post_id = post_id
    vote.account_id = current_account.id

    # validate check if user exist to vote this
    existing_vote = Vote.where(account_id: current_account.id, post_id: post_id)
    @new_vote = existing_vote.size < 1

    respond_to do |format|
      format.js {
        if existing_vote.size > 0
          #destroy existing vote
          existing_vote.first.destroy
        else
          #save new vote
          @success = vote.save ? true : false
        end
        @post = Post.find(post_id)
        @is_upvote = params[:upvote]
        render "votes/create"
      }
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:up_vote, :post_id)
  end
end
