class Blog < ApplicationRecord
    has_one_attached :image

    validates :title, presence: true
    validates :content, presence: true
    validates :image, presence: true
end
