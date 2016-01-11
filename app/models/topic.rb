class Topic < ActiveRecord::Base
  belongs_to :user

  has_many :bookmarks

  validates :title, length: { maximum: 10 }, presence: true
end
