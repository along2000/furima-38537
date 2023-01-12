class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  #has_one :order_record
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_source
  belongs_to :delivery_date
  validates :user, :text, :name, :price, :image, presence: true
 
  validates :price, format: { with: /\A[0-9]+\z/ , message: "price half-width number "},
  numericality: {greater_than: 299, less_than: 10000000, message: "price out of range"}
  validates :delivery_date_id, :delivery_charge_id, :delivery_source_id, :category_id, :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
end