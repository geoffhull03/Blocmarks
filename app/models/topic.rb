class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks

  def new
    @topic = Topic.new
  end
  
end
