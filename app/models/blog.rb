class Blog < ApplicationRecord
    has_one_attached :image
    belongs_to :user

    validates :title, presence: true
    validates :content, presence: true
    validates :image, presence: true
end
