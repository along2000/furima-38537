class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string     :name, null: false
      t.text       :text, null: false
      t.integer    :price, null: false
      t.integer    :category_id, null: false
      t.integer    :status_id, null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :delivery_source_id, null: false
      t.integer    :delivery_date_id, null: false
      t.timestamps
    end
  end
end
