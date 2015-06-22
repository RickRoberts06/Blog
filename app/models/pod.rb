class Pod < ActiveRecord::Base
  has_many :comment, dependent: :destroy
  belongs_to :user, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :title, presence: true, uniqueness: true

  def self.search(term)
    where(["body ILIKE ? OR title ILIKE ?", "%#{term}%", "%#{term}%"])
  end

  def liked_by?(user)
    likes.where(user: user).present?
  end

  def like_for(user)
    likes.find_by_user_id(user)
  end

end
