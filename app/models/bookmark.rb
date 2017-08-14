class Bookmark < ApplicationRecord
  belongs_to :topic

  def new
    @bookmark = Bookmark.new
  end
end
