class Post < ApplicationRecord
    validates :url, length: { minimum: 10}
    validates :description, length: { minimum: 1 }
end
