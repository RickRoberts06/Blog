class User < ActiveRecord::Base

 has_secure_password

 validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :pods, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_pods, through: :likes, source: :pod

  has_many :favorites, dependent: :destroy
  has_many :faved_pods, through: :favorites, source: :pod

  has_many :tags, dependent: :destroy
  has_many :tagged_pods, through: :tags, source: :pod

  def full_name
    "#{first_name} #{last_name}".strip.squeeze(" ")
  end

end
