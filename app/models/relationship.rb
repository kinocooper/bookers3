class Relationship < ApplicationRecord

# Userモデルの呼び名を便宜上2つに分けるようなイメージ?
# で、実際にはちゃんとUsersテーブルを見に行ってもらう必要があるのでクラス名の指定が必要
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name; "User"

end
