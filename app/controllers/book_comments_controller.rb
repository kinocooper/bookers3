class BookCommentsController < ApplicationController

  before_action:ensure_correct_user, only:[:destroy]

  def create
    book_comment = current_user.book_comments.new(book_id: params[:book_id])
    book_comment.update(book_comment_params)
    @book = Book.find(params[:book_id])
    # redirect_back(fallback_location: root_path) jsアクションに変更
  end

  def destroy
    book_comment = BookComment.find(params[:id])
    book_comment.destroy
    @book = Book.find(params[:book_id])
    # redirect_back(fallback_location: root_path) jsアクションに変更
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def ensure_correct_user
    book_comment = BookComment.find(params[:id])
    unless current_user == book_comment.user
      redirect_to books_path
    end
  end


end
