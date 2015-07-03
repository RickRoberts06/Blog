class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :pod

  validates :pod_id, uniqueness: {scope: :user_id}
end
