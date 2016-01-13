class Topic < ActiveRecord::Base
  belongs_to :user

  has_many :bookmarks,dependent: :destroy

  validates :title, length: { maximum: 15 }, presence: true

  def title=(s)
    write_attribute(:title, s.to_s.capitalize)
  end
end
