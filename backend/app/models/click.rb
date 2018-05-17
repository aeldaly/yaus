class Click < ApplicationRecord
    belongs_to :link
    has_many :details, class_name: 'ClickDetail'
end
