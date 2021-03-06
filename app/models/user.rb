class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username,
  presence: true,
  length: { in: 3..20 },
  uniqueness: true
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,:omniauthable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id",
    dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
    foreign_key: "followed_id",
    dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

    # ユーザーをフォローする
    def follow(other_user)
      following << other_user
    end

    # ユーザーをアンフォローする
    def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end

    # 現在のユーザーがフォローしてたらtrueを返す
    def following?(other_user)
      following.include?(other_user)
    end

def self.from_omniauth(auth)
  user = User.where(uid: auth.uid, provider: auth.provider).first

  unless user
    user = User.create(
      uid:      auth.uid,
      provider: auth.provider,
      email: User.get_email(auth),
      password: Devise.friendly_token[0, 20],
      # image: auth.info.image,
      username: auth.info.name
      )
  end

  return user
end
private

def self.get_email(auth)
  auth.info.email || "#{auth.uid}-#{auth.provider}@example.com"
end

end
