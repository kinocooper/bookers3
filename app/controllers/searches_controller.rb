class SearchesController < ApplicationController

  def search
    @search_table = params[:search_table]
    @search_words = params[:search_words]

    # 検索対象がbooksか？
    if @search_table == "books"
      # booksテーブルのnameを検索にかけて条件に合うモデルを取得
      @books = Book.where('title LIKE ?', "%#{params[:search_words]}%")
      # (自動的にsearch.html.erbへrender)

    # 検索対象がusersか？
    elsif @search_table == "users"
      # usersテーブルのtitleを検索にかけて条件に合うモデルを取得
      @users = User.where('name LIKE ?', "%#{params[:search_words]}%")
      # (自動的にsearch.html.erbへrender)
    end

  end

end
