class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_update :update_bookmark_user_name

  def liked(bookmark)
    likes.where(bookmark_id: @bookmark)
  end

  private

  def update_bookmark_user_name

    @bookmarks = Bookmark.where("user_id = ?", self.id)
    @bookmarks.each do |bookmark|
      bookmark.user_name = self.user_name
    end
  end

end
