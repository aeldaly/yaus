class Click < ApplicationRecord
    belongs_to :link

    validates :device, :ip, presence: true
end
