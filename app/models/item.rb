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
  validates :user, :text, :name, :price, presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end
#with_options presence: true, format: { with: /\A[0-9]+\z/ } do
  #validates :price, numericality: {only_integer: truegreater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, presence: { message: "can't be blank"} 
#end
  validates :delivery_date_id, :delivery_charge_id, :delivery_source_id, :category_id, :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
end