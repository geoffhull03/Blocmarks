class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  scope :visible_to, -> (user) { Bookmark.where(user: user) }
  scope :liked_by, -> (user) { Bookmark.where(id: Like.where(user: user).pluck(:bookmark_id)) }
end
