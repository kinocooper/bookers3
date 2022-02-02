class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites,dependent: :destroy
  has_many :book_comments,dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}


  def favorited_by?(user)
    # user_idカラムが引数userのidと一致するレコードがあればtrueを返す
    # 実際に探しているのはfavoritesのレコード！
    favorites.exists?(user_id: user.id)
  end
end
