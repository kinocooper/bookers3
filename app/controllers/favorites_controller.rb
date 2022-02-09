class FavoritesController < ApplicationController

  def create
    # ログイン中ユーザに結びつくfavoritesレコードをnew、book_idカラムに対象本idを入れる
    favorite = current_user.favorites.new(book_id: params[:book_id])
    favorite.save
    # jsでfavorite-btn部分テンプレをrenderする用に@bookを生成
    @book = Book.find(params[:book_id])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = current_user.favorites.find_by(book_id: params[:book_id])
    favorite.destroy
    @book = Book.find(params[:book_id])
    # redirect_back(fallback_location: root_path)
  end

end
