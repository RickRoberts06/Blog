class Pod < ActiveRecord::Base
  has_many :comment, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
