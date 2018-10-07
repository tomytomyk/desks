class Item < ApplicationRecord
    belongs_to :maker
    belongs_to :genre
end
