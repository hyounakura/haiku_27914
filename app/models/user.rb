class User < ApplicationRecord
  has_many :haikus
  has_many :favorites, dependent: :destroy
  has_many :fav_haikus, through: :favorites, source: :haiku
  has_many :following_relationships, foreign_key: 'followed_id', class_name: 'Follow', dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :followed_relationships, foreign_key: 'following_id', class_name: 'Follow', dependent: :destroy
  has_many :followeds, through: :followed_relationships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  def following?(other_user)
    followings.include?(other_user)
  end

  def follow(other_user)
    following_relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
end
