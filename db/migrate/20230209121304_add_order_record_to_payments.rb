class AddOrderRecordToPayments < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :order_record, null: false, foreign_key: true
  end
end
