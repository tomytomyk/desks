class Report < ApplicationRecord

    belongs_to :user
    belongs_to :language
    has_many :report_values
    has_many :sub_reports
    has_many :watchs

end
