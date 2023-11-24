class Ship < ApplicationRecord
    belongs_to :region
    belongs_to :purchase
end
