## usersテーブル
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| nickname            | string     | null: false                   |
| email               | string     | null: false,unique            |
| password            | string     | null: false                   |
| encrypted_password  | string     | null: false                   |
| first_name          | string     | null: false                   |
| last_name           | string     | null: false                   |
| first_name_kana     | string     | null: false                   |
| last_name_kana      | string     | null: false                   |
| birthday            | integer    | null: false                   |

### Association
- has_many :items
- belongs_to :delivery_address

## itemsテーブル
| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| name               | string      | null: false                     |
| text               | text        | null: false                     |
| price              | integer     | null: false                     |

### Association
- belongs_to :user
- belongs_to :order_record

## delivery_addressesテーブル
| Column                 | Type        | Options                         |
| ---------------------- | ----------- | ------------------------------- |
| user                   | references  | null: false, foreign_key: true  |
| credit_number          | integer     | null: false                     |
| credit_security_code   | integer     | null: false                     |
| credit_expiration_date | integer     | null: false                     |
| postcode               | integer     | null: false                     |
| prefecture_id          | string      | null: false                     |
| city                   | string      | null: false                     |
| block                  | string      | null: false                     |
| building               | string      | null: false                     |
| phone_number           | integer     | null: false                     |

### Association
- belongs_to :user
- belongs_to :order_record

## order_recordsテーブル
| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| status             | string      | null: false                     |
| item_id            | references  | null: false, foreign_key: true  |
| delivery_address   | references  | null: false, foreign_key: true  |

### Association
- belongs_to :item
- belongs_to :delivery_address