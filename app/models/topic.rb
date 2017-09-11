class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  scope :visible_to, -> (user) { Topic.where(id: Bookmark.where(user: user).pluck(:topic_id)) }
end
