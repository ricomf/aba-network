class Post < ApplicationRecord
    has_many :comments, as: :commentable

    validates :content, presence: true
    validates :published, inclusion: { in: [true, false] }
end
