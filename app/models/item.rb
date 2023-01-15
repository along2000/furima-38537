class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :order_record
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_source
  belongs_to :delivery_date
  validates :name,
            length: { maximum: 40, message: '40文字までです' }
  validates :text,
            length: { maximum: 1000, message: '1000文字までです' }
  validates :text, :name, :price, :image, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ },
                    numericality: { greater_than: 299, less_than: 10_000_000, message: '300から999999までの数字で入力してください' }
  validates :delivery_date_id, :delivery_charge_id, :delivery_source_id, :category_id, :status_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
