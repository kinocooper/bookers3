class SearchesController < ApplicationController

  def search
    @search_table = params[:search_table]
    @search_words = params[:search_words]
    search_pattern = params[:search_pattern]

    if @search_table == "books"
      search_column = "title"
      # @books = Book.search_specified_pattern(search_pattern,search_column)
      case search_pattern
      when "perfect"
        @books = Book.where("#{search_column} LIKE ?","#{@search_words}")
      when "prefix"
        @books = Book.where("#{search_column} LIKE ?", "#{@search_words}%")
      when "backward"
        @books = Book.where("#{search_column} LIKE ?", "%#{@search_words}")
      when "partial"
        @books = Book.where("#{search_column} LIKE ?", "%#{@search_words}%")
      end

    elsif @search_table == "users"
      search_column = "name"
      # @users = User.search_specified_pattern(search_pattern,search_column)
      case search_pattern
      when "perfect"
        @users = User.where("#{search_column} LIKE ?","#{@search_words}")
      when "prefix"
        @users = User.where("#{search_column} LIKE ?", "#{@search_words}%")
      when "backward"
        @users = User.where("#{search_column} LIKE ?", "%#{@search_words}")
      when "partial"
        @users = User.where("#{search_column} LIKE ?", "%#{@search_words}%")
      end
    end

  end


  private


end
