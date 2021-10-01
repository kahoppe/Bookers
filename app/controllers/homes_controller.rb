class HomesController < ApplicationController

  def top
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path(book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
