class Post < ApplicationRecord
  belongs_to :account
  belongs_to :community
  has_many :comments
  validates_presence_of :title, :body, :account_id, :community_id
  has_many :votes

  def score
    # different betwen upvote and downvote
    if self.up_vote > 0 || self.down_vote > 0
      self.up_vote > 0  ? (self.up_vote - self.down_vote) : (self.down_vote * -1)
    else
      0
    end
  end
end
