class Comment < ApplicationRecord
    belongs_to :product
    validates :commenter, presence: true
    validates :body, presence: true
end
