class Pod < ActiveRecord::Base
  has_many :comment, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
