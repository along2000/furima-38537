class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string     :postcode,           null: false
      t.integer    :delivery_source_id, null: false
      t.string     :city,               null: false
      t.string     :block,              null: false
      t.string     :building
      t.integer     :phone_number,       null: false
      t.timestamps
     
    end
  end
end
