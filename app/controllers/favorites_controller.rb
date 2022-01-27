class FavoritesController < ApplicationController

  def create
    # ログイン中ユーザに結びつくfavoritesレコードをnew、book_idカラムに対象本idを入れる
    favorite = current_user.favorites.new(book_id: params[:book_id])
    # favorite = Favorite.new
    # favorite.user_id = current_user.id
    # favorite.book_id = params[:book_id]
    favorite.save
    redirect_to books_path
  end

  def destroy
    favorite = current_user.favorites.find_by(book_id: params[:book_id])
    favorite.destroy
    redirect_to books_path
  end

end
