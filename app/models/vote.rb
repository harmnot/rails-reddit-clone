class Vote < ApplicationRecord
  belongs_to :account
  belongs_to :post

  validates_uniqueness_of :account_id, scope: :post_id

  after_create :increment_vote
  after_destroy :decrement_vote

  private

  def increment_vote
    field = self.upvote ? :up_vote : :down_vote
    Post.find(self.post_id).increment(field).save
  end

  def decrement_vote
    field = self.upvote ? :up_vote : :down_vote
    Post.find(self.post_id).decrement(field).save
  end
end