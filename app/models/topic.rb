class Topic < ActiveRecord::Base
  belongs_to :user

  has_many :bookmarks,dependent: :destroy

  validates :title, length: { maximum: 15 }, presence: true
  validates :user, presence: true

  def title=(s)
    self[:title] = s.downcase
  end

  def title
    self[:title].to_s.capitalize
  end
end
