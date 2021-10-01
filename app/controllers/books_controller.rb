class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path
    else
      render :edit
    end

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed."
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end