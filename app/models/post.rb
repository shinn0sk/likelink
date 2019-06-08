class Post < ApplicationRecord
    default_scope -> { order(created_at: :desc)}
    validates :name, presence: true, length: { maximum: 12}
    validates :description, presence: true, length: { maximum: 240}
    validates :url, length: { minimum: 10}

    belongs_to :user
    
    
    has_many :goods, dependent: :destroy
    def good_user(user_id)
        goods.find_by(user_id: user_id)
    end


end
