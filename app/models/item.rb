class Item < ApplicationRecord
    belongs_to :maker
    belongs_to :genre
    has_many :reports
end
