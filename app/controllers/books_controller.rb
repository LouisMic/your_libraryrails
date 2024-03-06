class BooksController < ApplicationController
  def create
  end

  def index
    @unread_books = Book.unread_books(current_user)
  end

  def show
    @book = Book.find(params[:id])
  end
end
