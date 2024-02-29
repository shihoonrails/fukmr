class Blog < ApplicationRecord
    extend FriendlyId
     friendly_id :title, use: :slugged
    has_one_attached :image
    belongs_to :user

    validates :title, presence: true
    validates :content, presence: true
    validates :image, presence: true
    validates :faculty, presence: true
    validates :rating, presence: true
end
