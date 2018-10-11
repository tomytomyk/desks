class Report < ApplicationRecord

    belongs_to :user
    belongs_to :item
    has_many :report_values

end
