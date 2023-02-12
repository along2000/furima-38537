class Payment < ApplicationRecord
  belongs_to :order_record
  belongs_to :delivery_source
end
