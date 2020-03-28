class Community < ApplicationRecord
  validates_presence_of :url, :name, :rules
  belongs_to :account
  has_many :posts
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :account

end
