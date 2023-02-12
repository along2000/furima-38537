## usersテーブル
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| nickname            | string     | null: false                   |
| email               | string     | null: false,unique: true      |
| encrypted_password  | string     | null: false                   |
| first_name          | string     | null: false                   |
| last_name           | string     | null: false                   |
| first_name_kana     | string     | null: false                   |
| last_name_kana      | string     | null: false                   |
| birthday            | date       | null: false                   |

### Association
- has_many :items
- has_many :order_records

## itemsテーブル
| Column               | Type        | Options                         |
| -------------------- | ----------- | ------------------------------- |
| user                 | references  | null: false, foreign_key: true  |
| name                 | string      | null: false                     |
| text                 | text        | null: false                     |
| price                | integer     | null: false                     |
| category_id          | integer     | null: false                     |
| status_id            | integer     | null: false                     |
| delivery_charge_id   | integer     | null: false                     |
| delivery_source_id   | integer     | null: false                     |
| delivery_date_id     | integer     | null: false                     |

### Association
- belongs_to :user
- has_one :order_record
- belongs_to :category
- belongs_to :status
- belongs_to :delivery_charge
- belongs_to :delivery_source
- belongs_to :delivery_date

## paymentsテーブル
| Column                 | Type        | Options                         |
| ---------------------- | ----------- | ------------------------------- |
| postcode               | string      | null: false                     |
| delivery_source_id     | integer     | null: false                     |
| city                   | string      | null: false                     |
| block                  | string      | null: false                     |
| building               | string      |                                 |
| phone_number           | integer      | null: false                     |
| order_record           | references  | null: false, foreign_key: true  |

### Association
- belongs_to :order_record
- belongs_to :delivery_source

## order_recordsテーブル
| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| user               | references  | null: false, foreign_key: true  |
| item               | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :payment