class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  monetize :total_cents
end
