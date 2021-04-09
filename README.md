アプリケーション名	マイトレ my-try
アプリケーション概要	ウエイトトレーニング初心者に向けて、トレーニングメニューの組み方やマシンの使い方、ジムの　　　　　　　　　　　利用方法等を提案する
URL	
テスト用アカウント	
利用方法	ユーザー登録を行ったら、ジムの利用方法マナー、心得を一読してください。
　　　　　次に本日のメニューリストを参考にトレーニングを行います。
　　　　　この際にトレーニングのやり方が分からない場合、トレーニング名称をクリックすればやり方と動画のページに遷移できます
　　　　　そのマシンでまずは自分の体重の半分程度の重量で限界まで行い、何回出来たかを登録します。
　　　　　その結果を元に、自分のMAXの値が登録され、次回からはセットメニューが表示されるようになります。
　　　　　あとは部位毎にくりかえし行います。

目指した課題解決	近年はジムの利用者が増え、ジム自体の数も増えてきている。
しかし、スタッフやインストラクターのいないジムも増え、そういったジムでは利用者はマシンの使い方が分からず、軽い重量で4〜5回行う程度で終わるのをよく見かける。ストレッチをして有酸素運動のみを行って帰る人も居るため、せっかくジムに来たのにもったいないなと思っていた。そのようなユーザー向けにジムの利用方法や適切な重量でのセットの組み方等を教えて上げたいと思いアプリ作成を行った。

洗い出した要件	ユーザー毎に合わせたトレーニングの提案　管理者ユーザーのみにしか追加できない項目の作成

実装予定の機能　カレンダー機能を実装し、その日に行ったトレーニング、重量、回数を記録する。
　　　　　　　　その日のトレーニングが終了したら、次の部位が表示される
ローカルでの動作方法


# My-tryのER図

## users テーブル

| Column                    | Type     | Options                  |
| ------------------------- | -------- | ------------------------ |
| nickname                  | string   | null: false              |
| email                     | string   | null: false unique: true |
| encrypted_password        | string   | null: false              |
| age                       | integer  | null: false              |
| purpose_body_id           | integer  | null: false              |
| day_training_time_id       | string   | null: false              |


### Association

- has_many :trainings
- has_many :maxes
- has_many :manners


## trainings テーブル

| Column               | Type       | Options                  |
| -------------------- | ---------- | ------------------------ |
| muscle_part_id       | integer    | null: false              |
| training_name        | string     | null: false unique: true |
| target_muscle        | string     | null: false              |
| training_description | text       | null: false              |
| video_url            | string     | null: false              |
| user                 | references | foreign_key: true        |


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