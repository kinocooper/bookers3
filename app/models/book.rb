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

  # def search_specified_pattern(search_pattern,search_column)
  #   case search_pattern
  #   when "perfect"
  #     where("#{search_column} LIKE ?","#{@search_words}")
  #   when "prefix"
  #     where("#{search_column} LIKE ?", "%#{@search_words}")
  #   when "backward"
  #     where("#{search_column} LIKE ?", "#{@search_words}%")
  #   when "partial"
  #     where("#{search_column} LIKE ?", "%#{@search_words}%")
  #   end

end
