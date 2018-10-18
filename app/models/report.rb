class Report < ApplicationRecord

    belongs_to :user
    belongs_to :item
    belongs_to :language
    has_many :report_values

end
