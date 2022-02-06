class Book < ApplicationRecord

  # include Search

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

  def self.search_specified_pattern(search_pattern,search_words)
    case search_pattern
    when "perfect"
      where("title LIKE ?","#{search_words}")
    when "prefix"
      where("title LIKE ?", "#{search_words}%")
    when "backward"
      where("title LIKE ?", "%#{search_words}")
    when "partial"
      where("title LIKE ?", "%#{search_words}%")
    end
  end

end
