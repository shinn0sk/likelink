class Post < ApplicationRecord
    default_scope -> { order(created_at: :desc)}
    validates :name, presence: true, length: { maximum: 12}
    validates :description, presence: true, length: { maximum: 240}
    validates :url, length: { minimum: 10}

    belongs_to :user


end
