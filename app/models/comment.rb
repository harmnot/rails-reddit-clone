class Comment < ApplicationRecord
  belongs_to :account
  belongs_to :post

  validates_presence_of :message, :account_id, :post_id
end
