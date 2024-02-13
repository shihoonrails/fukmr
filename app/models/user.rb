class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png],
             message: "有効なフォーマットではありません" },
             size: { less_than: 5.megabytes }
end
