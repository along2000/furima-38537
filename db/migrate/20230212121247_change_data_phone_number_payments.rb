class ChangeDataPhoneNumberPayments < ActiveRecord::Migration[6.0]
  def change
    change_column :payments, :phone_number, :string
  end
end
