# My-tryのER図

## users テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false unique: true |
| encrypted_password | string   | null: false              |
| age                | integer  | null: false              |
| purpose_body_id    | integer  | null: false              |
| how_long_time_id   | string   | null: false              |


### Association

- has_many :trainings
- has_many :maxes
- has_many :manners


## trainings テーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| muscle_part_id     | integer    | null: false              |
| training_name      | string     | null: false unique: true |
| target muscle      | string     | null: false              |
| video_url          | string     | null: false              |
| user               | references | foreign_key: true        |


### Association

- belongs_to :user
- has_one :max



## maxes テーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| max_weight         | integer    | null: false              |
| user               | references | foreign_key: true        |
| training           | references | foreign_key: true        |


### Association

- belongs_to :user
- belongs_to :training



## manners テーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| genre_id           | integer    | null: false              |
| title              | string     | null: false              |
| description        | text       | null: false              |
| user               | references | foreign_key: true        |


### Association

- belongs_to :user