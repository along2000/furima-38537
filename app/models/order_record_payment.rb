class OrderRecordPayment
  include ActiveModel::Model
  attr_accessor :postcode, :delivery_source_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: '郵便番号は「3桁ハイフン4桁」の半角文字列で入力してください' }, allow_blank: true
    validates :postcode
    validates :user_id
    validates :item_id
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '電話番号は10桁から11桁の数字のみ入力してください' }, allow_blank: true
    validates :phone_number
    validates :delivery_source_id, numericality: { other_than: 1, message: '都道府県を選択してください' }
    validates :token
  end

  def save
    order_record = OrderRecord.create(user_id: user_id, item_id: item_id)
    Payment.create(postcode: postcode, delivery_source_id: delivery_source_id, city: city, block: block, building: building,
                   phone_number: phone_number, order_record_id: order_record.id)
  end
end
