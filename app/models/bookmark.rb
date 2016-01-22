class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes, dependent: :destroy

  def user
    self.topic.user
  end
end
