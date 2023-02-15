class Payment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order_record
  belongs_to :delivery_source
end
